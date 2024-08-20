//
//  BridgeInit.m
//  ios-demo-objc
//
//  Created by Naman Anand on 15/12/23.
//
#import "NimbleNetController.h"
//#import "nimblenet.h"
#import "NimbleNetController.h"
#import <FunctionPointersImpl.h>
#import <Network/Network.h>
#import <yash-Swift.h>
//#import "ExecutorStructs.h"
//#import "nimblenetUtil.h"
//#import <NimbleNetiOS/NimbleNetiOS-Swift.h>




@interface NimbleNetController()

@property (strong, nonatomic) nw_path_monitor_t pathMonitor;
//@property (assign, nonatomic) HardwareInfo *hardwareInfo;

@end

@interface CUserInputWrapper : NSObject
typedef struct SinglePreprocessorInput SinglePreprocessorInput;
@end

@implementation NimbleNetController

NSDictionary *dataTypeMap;

-(NSDictionary*)initialize_nimblenet_controller:(NSString*)configJson {
    return (500, @"Invasjnlid config json");
    
    
    
//    initClientFunctionPointers();
//    NSString* nimbleSdkDirectory = createNimbleSdkDirectory();
//    dataTypeMap  = @{@"unknown": @0, @"float": @1, @"uint8": @2, @"int8": @3, @"uint16": @4, @"int16": @5, @"int32": @6, @"int64": @7, @"string": @8, @"bool": @9, @"float16": @10, @"double": @11, @"uint32": @12, @"uint64": @13, @"complex64": @14, @"complex128": @15, @"bfloat16": @16, @"json":@670};
//    
//    configJson = setInternalDeviceIdInConfig(configJson);
//    
//    if(configJson==nil){
//        return populateErrorReturnObject(500, @"Invalid config json");
//    }
//    
//    if(nimbleSdkDirectory!=nil){
//        // Subscribe to internet connection notifications.
//        self.pathMonitor = nw_path_monitor_create();
//        
//        __weak typeof(self) weakSelf = self;
//        nw_path_monitor_set_update_handler(self.pathMonitor, ^(nw_path_t  _Nonnull path) {
//            
//            __strong typeof(weakSelf) strongSelf = weakSelf;
//            
//            if (strongSelf) {
//                
//                nw_path_status_t status = nw_path_get_status(path);
//                
//                // Check the path status
//                if (status == nw_path_status_satisfied) {
//                    [self internet_switched_on_controller];
//                } else {
//                    NSLog(@"No internet connection");
//                }
//                
//            }
//            
//        });
//        nw_path_monitor_start(self.pathMonitor);
//        
//        // Send static device metrics
//        self.hardwareInfo = [[_hardwareInfo alloc] init];
//        NSString *staticMetricsJsonString = [self.hardwareInfo getStaticDeviceMetrics];
//        
//        @autoreleasepool {
//            const char *metricsCString = [staticMetricsJsonString UTF8String];
//            NSString *metricType = @"staticDevice";
//            const char *metricTypeCString = [metricType UTF8String];
//            [self write_metric_controller:metricTypeCString metricJson:metricsCString];
//        }
//        
//        NimbleNetStatus* status = initialize_nimblenet([configJson UTF8String], [nimbleSdkDirectory UTF8String]);
//        
//        NSDictionary* res = @{
//            @"status":@(status==NULL?true:false),
//            @"data":[NSNull null],
//            @"error":status==NULL?[NSNull null]:@{
//                @"code":@(status->code),
//                @"message":@(status->message)
//            }
//        };
//        
//        if(status!=NULL){
//            deallocate_nimblenet_status(status);
//            
//        }
//        return res;
//        
//    }
    
    return false;
}

-(NSDictionary*)add_event_controller:(NSString*)eventMapJsonString tableName:(NSString*)tableName{
    
    
    return (500, @"Invasjnlid config json");
    
//    
//    NimbleNetStatus* status = add_event([eventMapJsonString UTF8String], [tableName UTF8String]);
//    
//    NSDictionary* res = @{
//        @"status":@(status==NULL?true:false),
//        @"data":[NSNull null],
//        @"error":status==NULL?[NSNull null]:@{
//            @"code":@(status->code),
//            @"message":@(status->message)
//        }
//    };
//    
//    if(status!=NULL){
//        deallocate_nimblenet_status(status);
//    }
//    return res;
}

-(NSDictionary*)is_ready_controller{
//    NimbleNetStatus* status = is_ready();
//    
//    NSDictionary* res = @{
//        @"status":@(status==NULL?true:false),
//        @"data":[NSNull null],
//        @"error":status==NULL?[NSNull null]:@{
//            @"code":@(status->code),
//            @"message":@(status->message)
//        }
//    };
//    
//    if(status!=NULL){
//        deallocate_nimblenet_status(status);
//    }
//    
//    return res;
    return (500, @"Invasjnlid config json");
};

-(void)write_log_controller:(const char*)log{
   // write_log(log);
    return ;
};

-(void)write_metric_controller:(const char*)metricType metricJson:(const char*)metricJson{
    return;
    //write_metric(metricType, metricJson);
};

-(void)write_inference_metric_controller:(const char*)modelId totalTimeInUSecs:(int64_t)totalTimeInUSecs{
    return;
    //write_inference_metric(modelId, totalTimeInUSecs);
};

-(void)internet_switched_on_controller{
    return ;
    //internet_switched_on();
};

-(Boolean)load_task_controller:(NSString *)taskName taskCode:(NSString *)taskCode{
    return false;
}

-(NSDictionary*)add_feature_data_controller:(NSString *)featureName featureInputJsonString:(NSString *)featureInputJsonString  featureKey:(NSString *)featureKey{
    
    
    return (500, @"Invasjnlid config json");
    
//    NimbleNetStatus* status = add_feature_data([featureName UTF8String],[featureInputJsonString UTF8String]);
//    
//    NSDictionary* res = @{
//        @"status":@(status==NULL?true:false),
//        @"data":[NSNull null],
//        @"error":status==NULL?[NSNull null]:@{
//            @"code":@(status->code),
//            @"message":@(status->message)
//        }
//    };
//    
//    if(status!=NULL){
//        deallocate_nimblenet_status(status);
//    }
//    return res;
}

-(NSDictionary*)get_feature_liveness_controller:(NSString *)featureName{
    return (500, @"Invasjnlid config json");
//    int64_t liveness;
//    NimbleNetStatus* status = get_feature_liveness([featureName UTF8String], &liveness);
//    
//    NSDictionary* res = @{
//        @"status":@(status==NULL?true:false),
//        @"data":status!=NULL?[NSNull null]:@(liveness),
//        @"error":status==NULL?[NSNull null]:@{
//            @"code":@(status->code),
//            @"message":@(status->message)
//        }
//    };
//    
//    if(status!=NULL){
//        deallocate_nimblenet_status(status);
//    }
//    return res;
}

-(NSDictionary*)run_task_controller:(NSString *)guid
                           taskName:(NSString *)taskName
               modelInputsWithShape:(NSDictionary *)modelInputsWithShape
{
    
    return (500, @"Invasjnlid config json");
    
//    NSMutableArray<CUserInputWrapper *> *userInputArray = [NSMutableArray array];
//    
//    NSUInteger modelInputsLength = [modelInputsWithShape count];
//    
//    
//    CTensors req;
//    CTensors ret;
//    req.numTensors = modelInputsLength;
//    req.tensors = (CTensor*)malloc((req.numTensors) * sizeof(CTensor));
//    
//    
//    //model input transformer
//    int index = 0;
//    for (NSString *inputName in modelInputsWithShape) {
//        
//        NSDictionary* modelInputObjectData = modelInputsWithShape[inputName];
//        NSArray* modelInputObjectShape = modelInputsWithShape[inputName][@"shape"];
//        int shapeArrayLength = [modelInputObjectShape count];
//        
//        int64_t *int64ShapeArray = (int64_t *)malloc(sizeof(int64_t) * shapeArrayLength);
//        for (NSUInteger i = 0; i < shapeArrayLength; i++) {
//            int64ShapeArray[i] = [(NSNumber*)modelInputObjectShape[i] longLongValue];
//        }
//        
//        NSArray* arrayData = modelInputObjectData[@"data"];
//        int arrayDataType = [modelInputObjectData[@"type"] intValue];
//        NSUInteger arrayLength = [arrayData count];
//        
//        void* voidCastedArray = convertArraytoVoidPointer(arrayData, arrayLength, arrayDataType);
//        
//        if(voidCastedArray==nil){
//            return populateErrorReturnObject(5000,@"Datatype not yet supported");
//        }
//        
//        req.tensors[index].name = strdup([inputName UTF8String]);
//        req.tensors[index].data = voidCastedArray;
//        req.tensors[index].dataType = arrayDataType;
//        req.tensors[index].shape = int64ShapeArray;
//        req.tensors[index].shapeLength = shapeArrayLength;
//        
//        index++;
//    }
//    
//    NimbleNetStatus *nimbleNetStatus = run_method([taskName UTF8String], req, &ret);
//    
//    bool status = false;
//    
//    if(nimbleNetStatus==NULL){
//        status = true;
//    }
//    
//    NSDictionary *output = convertCTensorsToNSDictionary(nimbleNetStatus,ret);
//    
//    
//    //free memory
//    if (req.tensors != NULL) {
//        for (int i = 0; i < req.numTensors; i++) {
//            if (req.tensors[i].dataType != JSON){
//                free(req.tensors[i].data);
//            }
//            if (req.tensors[i].shape != NULL) {
//                free(req.tensors[i].shape);
//                free(req.tensors[i].name);
//            }
//        }
//        free(req.tensors);
//    }
//    
//    if(nimbleNetStatus!=NULL){
//        deallocate_nimblenet_status(status);
//        deallocate_output_memory2(ret.outputIndex);
//    }
//    return output;
}

-(void)reset_app_state_controller{
//    reset();
//    delete_database();
}

//private functions
NSString *createNimbleSdkDirectory(void) {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *subdirectory = @"nimbleSDK";
    NSString *directoryPath = [documentsDirectory stringByAppendingPathComponent:subdirectory];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:directoryPath]) {
        NSError *error = nil;
        if ([fileManager createDirectoryAtPath:directoryPath withIntermediateDirectories:YES attributes:nil error:&error]) {
            return directoryPath;
        }
    } else {
        return directoryPath;
    }
    
    return nil;
}

//output converters

//NSDictionary* convertCTensorsToNSDictionary(NimbleNetStatus* status,CTensors ctensors) {
//    return (500, @"Invasjnlid config json");
//    
////    NSDictionary *resultDict = [NSMutableDictionary dictionary];
////    NSDictionary *outputsTensorDict= [NSMutableDictionary dictionary];
////    
////    if(status==NULL){
////        for (int i = 0; i < ctensors.numTensors; i++) {
////            CTensor tensor = ctensors.tensors[i];
////            NSString *name = [NSString stringWithUTF8String:tensor.name];
////            
////            int dataLength = tensor.shapeLength;
////            NSMutableArray *dataArray = [NSMutableArray array];
////            NSMutableArray *shape = [NSMutableArray array];
////            int totalArrayLength = 1;
////            
////            for (int j = 0; j < tensor.shapeLength; j++) {
////                [shape addObject:@(tensor.shape[j])];
////                totalArrayLength*=tensor.shape[j];
////            }
////            
////            
////            switch (tensor.dataType) {
////                case INT32:{
////                    int* castedArrayData = (int *)tensor.data;
////                    for (int j = 0; j < totalArrayLength; j++) {
////                        [dataArray addObject:@(castedArrayData[j])];
////                    }
////                    break;
////                }
////                    
////                case FLOAT:{
////                    float* castedArrayData = (float *)tensor.data;
////                    for (int j = 0; j < totalArrayLength; j++) {
////                        [dataArray addObject:@(castedArrayData[j])];
////                    }
////                    break;
////                }
////                case DOUBLE:{
////                    double* castedArrayData = (double *)tensor.data;
////                    for (int j = 0; j < totalArrayLength; j++) {
////                        [dataArray addObject:@(castedArrayData[j])];
////                    }
////                    break;
////                }
////                case INT64:{
////                    long* castedArrayData = (long *)tensor.data;
////                    for (int j = 0; j < totalArrayLength; j++) {
////                        [dataArray addObject:@(castedArrayData[j])];
////                    }
////                    break;
////                }
////                    
////                default:
////                    return populateErrorReturnObject(5000, @"Output type not supported");
////            }
////            
////            
////            NSNumber *dataType = @(tensor.dataType);
////            
////            [outputsTensorDict setValue:@{
////                @"data": dataArray,
////                @"shape": shape,
////                @"type": dataType,
////            } forKey:name];
////        }
////        
////    }
////    
////    resultDict = @{
////        @"status":@(status==NULL?true:false),
////        @"data":status!=NULL?[NSNull null]:@{
////            @"outputs":outputsTensorDict,
////            @"size":@(ctensors.numTensors)
////        },
////        @"error":status==NULL?[NSNull null]:@{
////            @"code":@(status->code),
////            @"message":@(status->message)
////        }
////    };
////    
////    return [resultDict copy];
//}

void* convertArraytoVoidPointer(NSArray* arrayData, int arrayLength, int dataType){
//    switch (dataType) {
//        case INT32:{
//            int *cArray = (int *)malloc(arrayLength * sizeof(int));
//            for (NSUInteger i = 0; i < arrayLength; i++) {
//                NSNumber *number = [arrayData objectAtIndex:i];
//                cArray[i] = [number intValue];
//            }
//            return (void*) cArray;
//        }
//            
//        case FLOAT:{
//            float *cArray = (float *)malloc(arrayLength * sizeof(float));
//            for (NSUInteger i = 0; i < arrayLength; i++) {
//                NSNumber *number = [arrayData objectAtIndex:i];
//                cArray[i] = [number floatValue];
//            }
//            return (void*) cArray;
//        }
//        case DOUBLE:{
//            double *cArray = (double *)malloc(arrayLength * sizeof(double));
//            for (NSUInteger i = 0; i < arrayLength; i++) {
//                NSNumber *number = [arrayData objectAtIndex:i];
//                cArray[i] = [number doubleValue];
//            }
//            return (void*) cArray;
//        }
//        case INT64:{
//            long *cArray = (long *)malloc(arrayLength * sizeof(long));
//            for (NSUInteger i = 0; i < arrayLength; i++) {
//                NSNumber *number = [arrayData objectAtIndex:i];
//                cArray[i] = [number longValue];
//            }
//            return (void*) cArray;
//        }
//        case JSON:{
//            void *cJsonArray = create_json_array();
//            
//            for (int i = 0; i < arrayLength; i++) {
//                void *cjsonObject = create_json_object();
//                NSDictionary* jsonObject = arrayData[i];
//                
//                for (NSString *jsonKey in jsonObject) {
//                    id jsonValue = jsonObject[jsonKey];
//                    if(!addDataToCJson(cjsonObject,jsonKey,jsonValue)){
//                        return nil;
//                    }
//                }
//                
//                move_json_object_to_array(cJsonArray, cjsonObject);
//            }
//            return (void *) cJsonArray;
//            break;
//        }
//            
//        default:
//            return nil;
//    }
    return nil;
}

bool addDataToCJson(void* cjsonObject, NSString* jsonKey, id jsonValue){
//    if ([jsonValue isKindOfClass:[NSNumber class]]) {
//        NSNumber *numberValue = (NSNumber *)jsonValue;
//        const char *objCType = [numberValue objCType];
//        if (strcmp(objCType, @encode(int)) == 0) {
//            double intValue = [numberValue doubleValue];
//            add_int_value([jsonKey UTF8String], intValue, cjsonObject);
//        } else if (strcmp(objCType, @encode(long)) == 0) {
//            double longValue = [numberValue doubleValue];
//            add_int64_value([jsonKey UTF8String], longValue, cjsonObject);
//        } else if (strcmp(objCType, @encode(double)) == 0) {
//            double doubleValue = [numberValue doubleValue];
//            add_double_value([jsonKey UTF8String], doubleValue, cjsonObject);
//        } else if (strcmp(objCType, @encode(float)) == 0) {
//            double floatValue = [numberValue doubleValue];
//            add_float_value([jsonKey UTF8String], floatValue, cjsonObject);
//        }
//    } else if ([jsonValue isKindOfClass:[NSString class]]) {
//        add_string_value([jsonKey UTF8String], [jsonValue UTF8String], cjsonObject);
//    } else {
//        return false;
//    }
    
    return true;
}

NSDictionary* populateErrorReturnObject(int errorCode, NSString* message){
    return @{
        @"status":@(false),
        @"data":[NSNull null],
        @"error":@{
            @"code":@(errorCode),
            @"message":message
        }
    };
}


NSString *setInternalDeviceIdInConfig(NSString *jsonString){
    return @" ";
    //return [HardwareInfo getInternalDeviceIdWithJsonString:jsonString];
}

@end


