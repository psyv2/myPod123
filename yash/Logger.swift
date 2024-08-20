import Foundation

struct LogConfig: Decodable {
    var APIKey: String = "abcd" // Set by calling InitLogger function
    var url: URL = URL(string: "https://http-intake.logs.datadoghq.com/api/v2/logs")!
    var source: String = "iOS"
    var tags: String = "env:oyopoc,version:1.0"
    var service: String = "mobilesdk"
    var dateFormat: String = "yyyy-MM-dd hh:mm:ss"
    var logFileName: String = "logs.txt"
}

@objc public class Logger: NSObject {
    static let dateFormatter = DateFormatter()
    static var config: LogConfig = LogConfig()
    static let directoryURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    static var deviceId: String = "000"
    
    var file = #file
    var line = #line
    var col = #column
    var funcName = #function
    
    @objc public static let shared = Logger()
    override private init () {
        Logger.config = LogConfig()
        Logger.dateFormatter.dateFormat = Logger.config.dateFormat
    }
    
    @objc private func sendLog(message: String, level: String) {
        print(message)
        
        var request = URLRequest(url: Logger.config.url)
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue(Logger.config.APIKey, forHTTPHeaderField:"DD-API-KEY")
        request.httpMethod = "POST"
        let body: [String: String] = [
            "ddsource": Logger.config.source,
            "ddtags": Logger.config.tags,
            "hostname": Logger.deviceId,
            "message": message,
            "service": Logger.config.service,
            "status": level
        ]
        let jsonBody = try? JSONSerialization.data(withJSONObject: body)
        request.httpBody = jsonBody
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            //            if let data = data {
            //                print("HTTP Request success \(data)")
            //            } else if let error = error {
            //                print("HTTP Request Failed \(error)")
            //            }
        }
        
        task.resume()
    }
    
    @objc public func initLogger(deviceId: String, apiKey: String) {
        Logger.deviceId = deviceId
        Logger.config.APIKey = apiKey
    }
    
    @objc public func info(message: String) {
        let msg = "INFO: \(Logger.dateFormatter.string(from: Date())) \(message)"
        saveLog(message: msg)
    }
    
    @objc public func error(message: String) {
        let msg = "ERROR: \(Logger.dateFormatter.string(from: Date())) \(message)"
        sendLog(message: msg, level: "ERROR")
    }
    
    @objc public func fatal(message: String) {
        let msg = "FATAL: \(Logger.dateFormatter.string(from: Date())) \(message)"
        sendLog(message: msg, level: "FATAL")
    }
    
    @objc public func warn(message: String) {
        let msg = "WARN: \(Logger.dateFormatter.string(from: Date())) \(message)"
        saveLog(message: msg)
    }
    
    @objc public func debug(message: String) {
        let msg = "DEBUG: \(Logger.dateFormatter.string(from: Date())) \(message)"
        saveLog(message: msg)
    }
    
    @objc public func send_pending_logs() {
        let data = retrieveLogs()
        var request = URLRequest(url: Logger.config.url)
        request.setValue("application/json", forHTTPHeaderField:"Content-Type")
        request.setValue(Logger.config.APIKey, forHTTPHeaderField:"DD-API-KEY")
        request.httpMethod = "POST"
        let logs: [[String: String]] = data.map({(level: String, msg: String) -> [String: String] in
            // print("sending log: \(msg)")
            return [
                "ddsource": Logger.config.source,
                "ddtags": Logger.config.tags,
                "hostname": Logger.deviceId,
                "message": msg,
                "service": Logger.config.service,
                "status": level
            ]})
        let batchedLogs = logs.chunked(into: 700)
        batchedLogs.forEach({(body: [[String: String]]) -> () in
            let jsonBody = try? JSONSerialization.data(withJSONObject: body)
            request.httpBody = jsonBody
            let task = URLSession.shared.dataTask(with: request) {
                data, response, error in
                //                if let data = data {
                //                    print("HTTP Request success \(data)")
                //                } else if let error = error {
                //                    print("HTTP Request Failed \(error)")
                //                }
            }
            task.resume()
        })
        
    }
    
    private func saveLog(message: String) {
        print(message)
        
        let fileURL = Logger.directoryURL.appendingPathComponent(Logger.config.logFileName)
        if (!FileManager.default.fileExists(atPath: fileURL.path)) {
            FileManager.default.createFile(atPath: fileURL.path, contents: nil)
        }
        if let handle = try? FileHandle(forWritingTo: fileURL) {
            do {
                if #available(iOS 13.4, *) {
                    try handle.seekToEnd()
                } else {
                    // Fallback on earlier versions
                    handle.seekToEndOfFile()
                }
                handle.write((message+"\n").data(using: .utf8)!)
                //print("Log File saved to: \(fileURL)")
            } catch {
                //print("error appending to file")
            }
            handle.closeFile()
        } else {
            //print("Logs sve failed: \(fileURL)")
        }
    }
    
    private func retrieveLogs() -> [(String, String)] {
        let fileURL = Logger.directoryURL.appendingPathComponent(Logger.config.logFileName) //URL(fileURLWithPath: filePath, relativeTo: directoryURL)
        //print("---> In swift Retrieve LOG function fileURL: \(fileURL)")
        do {
            let data = try String(contentsOf: fileURL, encoding: .utf8)
            do {
                try FileManager.default.removeItem(at: fileURL)
            } catch {
            }
            //print("Retrieved logs: \(data)")
            return processLogs(data: data)
        } catch {
            //print("Error retrieving logs")
            return []
        }
    }
    
    private func processLogs(data: String) -> [(String, String)] {
        var logs = data.components(separatedBy: .newlines)
        // print(logs)
        logs.removeLast()
        // print(logs)
        return logs.map({(log: String) -> (String, String) in
            // print(log)
            let level = log.components(separatedBy: ":")[0]
            // print(level)
            // print(log)
            return (level,log)
        })
    }
    
    private class func extractFileName(filePath: String) -> String {
        let components = filePath.components(separatedBy: "/")
        return components.isEmpty ? "" : components.last!
    }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
