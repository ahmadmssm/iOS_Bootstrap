//
//  AlamofireActivityLogger.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

class AlamofireActivityLogger {
    func debugPrint(_ item: @autoclosure () -> Any, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        print(item(), separator: separator, terminator: terminator)
        #endif
    }
    
    func debugPrettyPrint(_ item: @autoclosure () -> Any, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        // print(String(data: try! JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted), encoding: .utf8)!)
        #endif
    }
    
    func JSONResponseDataFormatter(_ data: Data) -> Data {
        do {
            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
            return prettyData
        } catch {
            return data // fallback to original data if it can't be serialized.
        }
    }
}
