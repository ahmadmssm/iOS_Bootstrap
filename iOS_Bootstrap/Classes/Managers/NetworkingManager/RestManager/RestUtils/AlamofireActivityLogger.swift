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
    
    func debugPrettyPrint(_ text: String, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        if let data = text.data(using: .utf8),
           let json = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers),
           let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
            let formattedString = String(decoding: jsonData, as: UTF8.self)
            print(formattedString, separator: separator, terminator: terminator)
        }
        else {
            debugPrint(text)
        }
        #endif
    }
    
    func debugPrettyPrint(_ data: Data?, separator: String = " ", terminator: String = "\n") {
        #if DEBUG
        if (data != nil) {
            if let json = try? JSONSerialization.jsonObject(with: data!, options: .mutableContainers),
               let jsonData = try? JSONSerialization.data(withJSONObject: json, options: .prettyPrinted) {
                let formattedString = String(decoding: jsonData, as: UTF8.self)
                print(formattedString, separator: separator, terminator: terminator)
            }
            else {
                debugPrint("Invalid JSON")
            }
        }
        else {
            debugPrint("No response body")
        }
        #endif
    }
}
