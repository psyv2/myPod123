import Foundation

public class NimbleNetApi{
    
    private static let nimbleNetController: NimbleNetController = NimbleNetController();
    
    public static func initialize(config:NimbleNetConfig)->NimbleNetResult<Void>{
        
        var config = config
        var res:NSDictionary
        
        do {
            let encoder = JSONEncoder()
            let jsonData = try encoder.encode(config)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                
                res = nimbleNetController.initialize_nimblenet_controller(jsonString)! as NSDictionary
                return NimbleNetResult<Void>(data: NSDictionary(dictionary: res))
            }
            else{
                return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "invalid nimblenet config")
                
            }
        } catch {
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: initNimbleNet \(error)")
        }
    }
    
    public static func initialize(config:String) -> NimbleNetResult<Void>{
        
        if let jsonData = config.data(using: .utf8) {
            do {
                
                let nimbleNetConfig = try JSONDecoder().decode(NimbleNetConfig.self, from: jsonData)
                
                return initialize(config: nimbleNetConfig)
                
            } catch {
                return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: initNimbleNet \(error)")
            }
        }
        else{
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "invalid nimblenet config json")
            
        }
    }
    
    public static func addEvent(events: [String: Any], tableName: String) -> NimbleNetResult<Void> {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: events, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                let res = nimbleNetController.add_event_controller(jsonString, tableName:tableName)!
                return NimbleNetResult<Void>(data: NSDictionary(dictionary:res))
            }
            else{
                return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "invalid events")
            }
        } catch {
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: addEvent \(error)")
            
        }
    }
    
    public static func isReady() -> NimbleNetResult<Unit>
    {
        do{
            let res = nimbleNetController.is_ready_controller()
            return NimbleNetResult<Unit>(data: res as! NSDictionary)
        }
        catch{
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: isReady \(error)")
            
        }
    }
    
    public static func runMethod(methodName: String, inputs: [String: ModelInput], guid:String?) -> NimbleNetResult<NimbleEdgeOutput> {
        
        do{
            var inputDict:[String: [String: Any]] = [:]
            
            for (name, value) in inputs {
                var shape:[Int] = []
                if(value.shape == []){
                    shape.append((value.data as! [Any]).count)
                }
                else{
                    shape = value.shape as! [Int]
                }
                
                inputDict[name] = [
                    "data": value.data,
                    "shape": shape,
                    "type":value.datatype.value
                ]
            }
            
            let res = nimbleNetController.run_task_controller(guid,taskName:methodName,modelInputsWithShape: inputDict)!
            
            return NimbleNetResult<NimbleEdgeOutput>(data: NSDictionary(dictionary: res))
        }
        catch{
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: runTask \(error)")
            
        }
        
    }
    
    public static func getFeatureLiveness(featureName:String) -> NimbleNetResult<Int>{
        do{
            let res = nimbleNetController.get_feature_liveness_controller(featureName)!
            return NimbleNetResult<Int>(data: NSDictionary(dictionary: res))
        }
        catch{
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: getFeatureLiveness \(error)")
            
        }
    }
    
    public static func addFeatureData(featureName:String,featureInputJsonString:String,featureKey:String) -> NimbleNetResult<Void>{
        
        do{
            let res = nimbleNetController.add_feature_data_controller(featureName, featureInputJsonString: featureInputJsonString, featureKey:featureKey )!
            return NimbleNetResult<Void>(data: NSDictionary(dictionary:res))
        }
        catch{
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: addFeatureData \(error)")
        }
        
    }
    
    public static func addFeatureData(featureName:String,featureInput:[[String:Any]],featureKey:String) -> NimbleNetResult<Void> {
        
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: featureInput, options: .prettyPrinted)
            if let jsonString = String(data: jsonData, encoding: .utf8) {
                
                let res = nimbleNetController.add_feature_data_controller(featureName, featureInputJsonString: jsonString, featureKey:featureKey )!
                return NimbleNetResult<Void>(data: NSDictionary(dictionary:res))
                
            }
            else{
                return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "Invalid JSON passed for addFeatureData")
            }
        } catch {
            return populateNimbleNetResultWithError(errorCode: 5000, errorMessage: "exception: addFeatureData \(error)")
        }
    }
    
    //utils
    private static func createNimbleEdgeDirectory() -> String {
        guard let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else {
            fatalError("Failed to get documents directory.")
        }
        
        let folderName = "nimbleSDK"
        let folderURL = documentsDirectory.appendingPathComponent(folderName)
        
        do {
            try FileManager.default.createDirectory(at: folderURL, withIntermediateDirectories: true, attributes: nil)
            print("Folder created successfully at path: \(folderURL.path)")
        } catch {
            print("Error creating folder: \(error.localizedDescription)")
        }
        
        return folderURL.path
    }
    
    private static func convertToVoidPointer<T>(_ value: T) -> UnsafeMutableRawPointer {
        let pointer = UnsafeMutablePointer<T>.allocate(capacity: 1)
        pointer.initialize(to: value)
        return UnsafeMutableRawPointer(pointer)
    }
    
    
    private static func populateNimbleNetResultWithError<T>(errorCode:Int,errorMessage:String) -> NimbleNetResult<T>{
        let dict: NSDictionary = [
            "status": false,
            "data": NSNull(),
            "error": [
                "code":errorCode,
                "message":errorMessage
            ] as [String : Any]
        ]
        return NimbleNetResult<T>(data: dict)
    }
    
}


