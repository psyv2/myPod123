import Foundation
import Alamofire



//@objc protocol ConnectionLayerViewModelProtocol : NSObject {
//    func sendRequest(url: String, reqBody: String, reqHeaders: String, method: String) -> CNetworkResponse
//}
@objc public class CNetworkResponse: NSObject {
    @objc public var statusCode: Int
    @objc public var headers: UnsafeMutablePointer<CChar>?
    @objc public var body: UnsafeMutablePointer<CChar>?
    @objc public var bodyLength: Int

    @objc public init(statusCode: Int,  headers: UnsafeMutablePointer<CChar>?, body: UnsafeMutablePointer<CChar>?, bodyLength: Int) {
        self.statusCode = statusCode
        self.headers = headers
        self.body = body
        self.bodyLength = bodyLength
    }
}


@objc public class ConnectionLayer: NSObject {
    
    @objc public func sendRequest(url: String, reqBody: String, reqHeaders: String, method: String, length:Int) -> CNetworkResponse {
        
        guard let urlString = URL(string: url) else {
            return CNetworkResponse(statusCode: 0, headers: nil, body: nil, bodyLength: 0)
        }
        var request = URLRequest(url: urlString, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10.0)
        request.httpMethod = method
        
        if let requestBody = Constants.convertToJSONBody(from: reqBody) {
            do {
                request = try JSONEncoding.default.encode(request, with: requestBody)
            } catch {
                debugPrint("JSON request body encoding error for request to url: \(url)")
            }
        }
        
       // request.headers = [:]
        
        if let requestHeader = Constants.convertToObject(from: reqHeaders) {
            for header in requestHeader {
                request.setValue(header.value, forHTTPHeaderField: header.key)
            }
        }
        
        var statusCode: Int32 = 0
        var headers: UnsafeMutablePointer<CChar>? = nil
        var body: UnsafeMutablePointer<UInt8>? = nil
        var bodyLength: Int32 = 0
        
        let sem = DispatchSemaphore(value: 0)
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            defer {sem.signal()}
            
            guard error == nil else {
                return
            }
            
            if let response = response as? HTTPURLResponse {
                statusCode = Int32(response.statusCode)
                let contentType = response.allHeaderFields["Content-Type"] as? String
                print(contentType)
            }
            
            guard let data = data else {
                return
            }
            let bytes = [UInt8](data)
            let responseDataCount = data.count
            
            body = malloc(bytes.count * MemoryLayout<UInt8>.stride).bindMemory(to: UInt8.self, capacity: bytes.count)
            body?.initialize(from: bytes, count: responseDataCount)
            
            
            bodyLength = Int32(data.count)
            
        }
        task.resume()
        sem.wait()
        
        var bodyCCharPointer: UnsafeMutablePointer<CChar>?
        body?.withMemoryRebound(to: CChar.self, capacity: Int(bodyLength)) { cCharBuffer in
            // Inside the closure, cCharBuffer is the buffer with the correct type
            // Assign it to the cCharPointer for use outside the closure
            bodyCCharPointer = cCharBuffer
        }
        
        
        let response = CNetworkResponse(statusCode: Int(statusCode), headers: headers, body: bodyCCharPointer, bodyLength: Int(bodyLength))
        
        return response
        
    }
    
}
