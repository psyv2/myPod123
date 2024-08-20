//
//  FunctionPointersImpl.h
//  iosdemosdk
//
//  Created by Naman Anand on 15/12/23.
//

#ifndef FunctionPointersImpl_h
#define FunctionPointersImpl_h"
//#import "nimblenetUtil.h"
@class HardwareInfo;
@class ConnectionLayer;
@class Logger;
void initClientFunctionPointers(void);
//CNetworkResponse send_request_interop(const char *body, const char *headers, const char *url,
//                                      const char *method, int length);
char *get_metrics_interop(const char *metric);
void log_debug_interop(const char *message);
void log_info_interop(const char *message);
void log_warn_interop(const char *message);
void log_error_interop(const char *message);
void log_fatal_interop(const char *message);
bool disk_cleanup_interop(const char *directoryWithCurrentTag, const char *commonDirectory);
int download_model_interop(const char *url, const char *headers, const char *fileName, const char *tagDir);

#endif /* FunctionPointersImpl_h */
