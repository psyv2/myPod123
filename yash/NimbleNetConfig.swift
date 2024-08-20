//
//  NimbleNetConfig.swift
//  demo
//
//  Created by Harshit Kushwah on 19/08/24.
//

import Foundation
public struct NimbleNetConfig: Codable {
    public let clientId: String
    public let clientSecret: String
    public let modelIds: [String]
    public let host: String
    public let deviceId: String
    public let debug: Bool
    public let initTimeOutInMs: Int
    public let backgroundInstall: Bool
    public let featureStores: [String]
    public let databaseConfig: [DatabaseTable]
    public let maxInputsToSave: Int
    public var compatibilityTag: String
    
    public init(clientId: String,
                clientSecret: String,
                modelIds: [String],
                host: String,
                deviceId: String,
                debug: Bool,
                initTimeOutInMs: Int,
                backgroundInstall: Bool,
                featureStores: [String],
                databaseConfig: [DatabaseTable],
                maxInputsToSave: Int,
                compatibilityTag:String) {
        self.clientId = clientId
        self.clientSecret = clientSecret
        self.modelIds = modelIds
        self.host = host
        self.deviceId = deviceId
        self.debug = debug
        self.initTimeOutInMs = initTimeOutInMs
        self.backgroundInstall = backgroundInstall
        self.featureStores = featureStores
        self.databaseConfig = databaseConfig
        self.maxInputsToSave = maxInputsToSave
        self.compatibilityTag = compatibilityTag
    }
}
public struct DatabaseTable: Codable {
    public let tableName: String
    public let schema: [String: String]
    public let expiryInMins: Int
    
    public init(tableName: String, schema: [String : String], expiryInMins: Int) {
        self.tableName = tableName
        self.schema = schema
        self.expiryInMins = expiryInMins
    }
}
