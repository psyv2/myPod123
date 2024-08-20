//
//  MODEL_DOWNLOAD_STATUS.swift
//  NimbleNetiOS
//
//  Created by Naman Anand on 12/04/24.
//


import Foundation

@objc
public enum MODEL_DOWNLOAD_STATUS: Int {
    case DOES_NOT_EXIST = 10000
    case PENDING = 10001
    case SUCCESS = 10002
    case FAILURE = 10003
    
    var value: Int {
        return self.rawValue
    }
}
