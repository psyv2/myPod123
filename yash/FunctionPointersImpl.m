//
//  FunctionPointersImpl.m
//  iosdemosdk
//
//  Created by Naman Anand on 15/12/23.
//

#import <Foundation/Foundation.h>
#import "FunctionPointersImpl.h"
//#import <NimbleNetiOS/NimbleNetiOS-Swift.h>
#import <yash-Swift.h>
//#import "client.h"
#import <zlib.h>

const char* concatStrings(const char* str1, const char* str2) {
    size_t len1 = strlen(str1);
    size_t len2 = strlen(str2);
    size_t totalLen = len1 + len2 + 1;
    
    char* result = (char*)malloc(totalLen);
    if (result == NULL) {
        perror("Memory allocation error");
        exit(EXIT_FAILURE);
    }
    
    strcpy(result, str1);
    
    strcat(result, str2);
    
    return result;
}

BOOL fileExistsAtPath(const char *filePath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *path = [NSString stringWithUTF8String:filePath];
    return [fileManager fileExistsAtPath:path];
}

void renameFile(const char *currentFilePath, const char *newFilePath) {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error = nil;

    NSString *currentPath = [NSString stringWithUTF8String:currentFilePath];
    NSString *newPath = [NSString stringWithUTF8String:newFilePath];

    // Check if the file exists at the current path
    if ([fileManager fileExistsAtPath:currentPath]) {
        // Attempt to rename the file
        BOOL success = [fileManager moveItemAtPath:currentPath toPath:newPath error:&error];
        if (success) {
            NSLog(@"File renamed successfully.");
        } else {
            NSLog(@"Error renaming file: %@", error.localizedDescription);
        }
    } else {
        NSLog(@"File does not exist at path: %s", currentFilePath);
    }
}

void decompressGzippedFile(const char* gzippedFilePath) {
    // Open the gzipped file for reading in binary mode
    gzFile gzFile = gzopen(gzippedFilePath, "rb");
    if (!gzFile) {
        NSLog(@"Failed to open gzipped file for reading: %s", gzippedFilePath);
        return;
    }

    // Create a buffer for decompressed data
    const int bufferSize = 1024;
    char buffer[bufferSize];

    // Append ".out" to the gzipped file name for the decompressed file
    char decompressedFilePath[strlen(gzippedFilePath) + 5]; // +5 for ".out" and null terminator
    strcpy(decompressedFilePath, gzippedFilePath);
    strcat(decompressedFilePath, ".out");

    // Open the decompressed file for writing in binary mode
    FILE *decompressedFile = fopen(decompressedFilePath, "wb");
    if (!decompressedFile) {
        NSLog(@"Failed to create decompressed file for writing: %s", decompressedFilePath);
        gzclose(gzFile);
        return;
    }

    // Decompress and write the data to the decompressed file
    int bytesRead;
    while ((bytesRead = gzread(gzFile, buffer, bufferSize)) > 0) {
        fwrite(buffer, 1, bytesRead, decompressedFile);
    }

    // Close the files and cleanup
    gzclose(gzFile);
    fclose(decompressedFile);
    NSLog(@"File decompressed and saved to %s", decompressedFilePath);
    
    remove(gzippedFilePath);
    
    rename(decompressedFilePath, gzippedFilePath);

}

void initClientFunctionPointers(void){
//    send_request_global = send_request_interop;
//    get_metrics_global = get_metrics_interop;
//    log_verbose_global = log_debug_interop;
//    log_debug_global = log_debug_interop;
//    log_info_global = log_debug_interop;
//    log_warn_global = log_debug_interop;
//    log_error_global = log_debug_interop;
//    log_fatal_global = log_debug_interop;
//    disk_cleanup_global = disk_cleanup_interop;
//    download_model_global = download_model_interop;
}

CNetworkResponse* send_request_interop(const char *body, const char *headers, const char *url,
                                      const char *method, int length){
    ConnectionLayer *connectionLayer = [[ConnectionLayer alloc] init];
    return [connectionLayer sendRequestWithUrl:[NSString stringWithUTF8String:url] reqBody:[NSString stringWithUTF8String:body] reqHeaders:[NSString stringWithUTF8String:headers] method:[NSString stringWithUTF8String:method] length:length];
}

char *get_metrics_interop(const char *metric){
    HardwareInfo *hardwareInfo = [[HardwareInfo alloc] init];
    NSString *metricJson = [hardwareInfo getMetricsJSON];
    return strdup([metricJson UTF8String]);
}

void log_debug_interop(const char *message) {
    Logger *logger = [Logger shared];
    [logger debugWithMessage:[NSString stringWithUTF8String:message]];
}

void log_info_interop(const char *message) {
    Logger *logger = [Logger shared];
    [logger infoWithMessage:[NSString stringWithUTF8String:message]];
}

void log_warn_interop(const char *message) {
    Logger *logger = [Logger shared];
    [logger warnWithMessage:[NSString stringWithUTF8String:message]];
}

void log_error_interop(const char *message) {
    Logger *logger = [Logger shared];
    [logger errorWithMessage:[NSString stringWithUTF8String:message]];
}

void log_fatal_interop(const char *message) {
    Logger *logger = [Logger shared];
    [logger fatalWithMessage:[NSString stringWithUTF8String:message]];
}

bool disk_cleanup_interop(const char *directoryWithCurrentTag, const char *commonDirectory) {
    FileIO *fileIO = [FileIO shared];
    return [fileIO performDiskCleanupWithCommonFolderName:[NSString stringWithUTF8String:commonDirectory]
                                            tagFolderName:[NSString stringWithUTF8String:directoryWithCurrentTag]];
}

int download_model_interop(const char *url, const char *headers, const char *fileName, const char *tagDir){
    CNetworkResponse *res = send_request_interop("", headers, url, "GET", 0);
    
    if(res.statusCode>=200 && res.statusCode < 300){
        const char* filePath = concatStrings(tagDir,fileName);
        
        if (!fileExistsAtPath(filePath)) {
            FILE *file = fopen(filePath, "w");
            fwrite(res.body, 1, res.bodyLength, file);
            fclose(file);
            NSLog(@"ByteBuffer saved to %s", filePath);
            // decompressGzippedFile(filePath);
            return (long)MODEL_DOWNLOAD_STATUSSUCCESS;
        } else {
            NSLog(@"File already exists %s", filePath);
            return (long)MODEL_DOWNLOAD_STATUSSUCCESS;
        }
    }
    
    return (long)MODEL_DOWNLOAD_STATUSFAILURE;
}

