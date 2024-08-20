#import "NimbleNetApi.h"
#import "NimbleNetController.h"
#import <Foundation/Foundation.h>


NimbleNetController *controller = nil;

NSDictionary* initializeNimbleNet(NSString *config){
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        controller = [[NimbleNetController alloc] init];
    });
    
    return [controller initialize_nimblenet_controller:config];
}

NSDictionary* addEvent(NSString *eventMapJsonString,NSString *tableName){
    return [controller add_event_controller:eventMapJsonString tableName:tableName];
}

NSDictionary* runMethod(NSString *guid,
                        NSString *taskName,
                          NSDictionary *inputMap){
    
    return [controller run_task_controller:guid
                                  taskName:taskName modelInputsWithShape:inputMap];
}

NSDictionary* addFeatureData(NSString *featureName, NSString *featureInputJsonString, NSString *featureKey){
    return [controller add_feature_data_controller:featureName featureInputJsonString:featureInputJsonString featureKey:featureKey];
}

NSDictionary* getFeatureLiveness(NSString *featureName){
    return [controller get_feature_liveness_controller:featureName];
}

NSDictionary* isReady(){
    return [controller is_ready_controller];
}

void resetAppState(){
    [controller reset_app_state_controller];
}


