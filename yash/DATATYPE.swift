
import Foundation

public enum DATATYPE: Int {
    case undefined = 0
    case float = 1
    case uint8 = 2
    case int8 = 3
    case uint16 = 4
    case int16 = 5
    case int32 = 6
    case int64 = 7
    case string = 8
    case bool = 9
    case float16 = 10
    case double = 11
    case uint32 = 12
    case uint64 = 13
    case complex64 = 14
    case complex128 = 15
    case bfloat16 = 16
    case byteBuffer = 550
    case json = 670
    
    init(value: Int) {
        if let dataType = DATATYPE(rawValue: value) {
            self = dataType
        } else {
            self = .undefined
        }
    }
    
    var value: Int {
        return self.rawValue
    }
}
