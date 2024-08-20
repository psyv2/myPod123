//
//  ModelInput.swift
//  NimbleNetiOS
//
//  Created by Naman Anand on 14/03/24.
//

import Foundation

public struct ModelInput {
    var data: Any
    var datatype: DATATYPE
    //shape as null means singular input
    //shape as an empty array means 1xlength(array)
    var shape: [Int]?

    public init(data: Any, datatype: DATATYPE, shape: [Int] = []) {
        self.data = data
        self.datatype = datatype
        self.shape = shape
    }
}
