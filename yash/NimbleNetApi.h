#ifndef NimbleNetApi_h
#define NimbleNetApi_h
#import <Foundation/Foundation.h>

NSDictionary* initializeNimbleNet(NSString *config);
NSDictionary* addEvent(NSString *eventMapJsonString,NSString *tableName);
NSDictionary* isReady();
NSDictionary* runMethod(NSString *guid,
                 NSString *taskName,
                   NSDictionary *inputMap);
NSDictionary* runMethodJsonString(NSString *guid,
                        NSString *taskName,
                                  NSString *inputString);
NSDictionary* addFeatureData(NSString *featureName, NSString *featureInputJsonString, NSString *featureKey);
NSDictionary* getFeatureLiveness(NSString *featureName);
void resetAppState();

#endif
