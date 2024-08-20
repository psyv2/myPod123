#ifndef NimbleNetController_h
#define NimbleNetController_h
#import <Foundation/Foundation.h>


@interface NimbleNetController : NSObject

-(NSDictionary*)initialize_nimblenet_controller:(NSString *)configJson;
-(NSDictionary*)add_event_controller:(NSString *)eventMapJsonString tableName:(NSString *)tableName;
-(NSDictionary*)is_ready_controller;
-(NSDictionary*)run_task_controller:(NSString *)guid
                           taskName:(NSString *)taskName
               modelInputsWithShape:(NSDictionary *)modelInputsWithShape;
-(Boolean)load_task_controller:(NSString *)taskName taskCode:(NSString *)taskCode;
-(NSDictionary*)add_feature_data_controller:(NSString *)featureName featureInputJsonString:(NSString *)featureInputJsonString  featureKey:(NSString *)featureKey;
-(NSDictionary*)get_feature_liveness_controller:(NSString *)featureName;

-(void)write_log_controller:(const char*)log;
-(void)write_metric_controller:(const char*)metricType metricJson:(const char*)metricJson;
-(void)write_inference_metric_controller:(const char*)modelId totalTimeInUSecs:(int64_t)totalTimeInUSecs;
-(void)internet_switched_on_controller;
-(void)reset_app_state_controller;

@end

#endif
