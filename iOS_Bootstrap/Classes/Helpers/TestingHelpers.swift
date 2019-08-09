//
//  TestingHelpers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

open class TestingHelpers {
    
    public static func isRunningTests() -> Bool {
        return ProcessInfo.processInfo.environment["XCTestConfigurationFilePath"] != nil
    }
    
    private static func getJsonContentAsStringFromFile(fileName: String) -> String? {
        guard let file = Bundle.main.path(forResource: fileName, ofType: "json")
            else { return nil }
        return try! String(contentsOfFile: file)
    }
    
    public static func getDataFromJsonFileWith(name: String) -> Data? {
        guard let jsonData = getJsonContentAsStringFromFile(fileName: name)?.data(using: String.Encoding(rawValue: String.Encoding.utf8.rawValue)) else {
            return nil
        }
        return jsonData
    }
    
    public static func getObjectFromData<T: Decodable>(type: T.Type, fileName: String) -> T? {
        if let jsonData =  getDataFromJsonFileWith(name: fileName) {
            let object = try? JSONDecoder().decode(T.self, from: jsonData)
            return object
        }
        return nil
    }
   
    public static func getObjectsFromData<T: Decodable>(type: T.Type, fileName: String) -> [T?]? {
        let objects = try? JSONDecoder().decode([T].self, from: getDataFromJsonFileWith(name: fileName)!)
        return objects
    }
}
