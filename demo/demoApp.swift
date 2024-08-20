//
//  AppDelegate.swift
//  nimblenet_ios
//
//  Created by 46650369 on 12/18/2023.
//  Copyright (c) 2023 46650369. All rights reserved.
//

import UIKit
import yash

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        print("successsss")
        let config = NimbleNetConfig(clientId: "mobile-test-client", clientSecret: "samplekey123", modelIds: ["workflow_uint8",
                                                                                                              "workflow_int8",
                                                                                                              "workflow_int32",
                                                                                                              "workflow_int64",
                                                                                                              "workflow_float32",
                                                                                                              "workflow_float64"
                                                                                                             ], host: "https://api.nimbleedge-staging.com", deviceId: "nimon", debug: true, initTimeOutInMs: 500000, backgroundInstall: false, featureStores: [], databaseConfig: [], maxInputsToSave: 5, compatibilityTag: "DEFAULT-TAG")
        
        print(NimbleNetApi.initialize(config:config))
        sleep(5)
//        let modelInputs: [String: [String: Any]] = [
//            "model_input": [
//                "data": [1,2,3,4],
//                "shape": [4],
//                "type":"int32"
//            ]
//        ]
        
        let modelInputs: [String: ModelInput] = [
            "model_input": ModelInput(data: [1,2,3,4], datatype: DATATYPE.int32)
        ]
        
        let res = NimbleNetApi.runMethod(methodName: "int32", inputs: modelInputs, guid: nil)
        let hello = 5
        print(res)

        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}



