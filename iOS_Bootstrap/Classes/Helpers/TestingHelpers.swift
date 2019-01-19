//
//  TestingHelpers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

open class TestingHelpers {
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
    
    public static func getbjectFromData<T: Decodable>(type: T.Type, fileName: String) -> T? {
        let object = try? JSONDecoder().decode(T.self, from: getDataFromJsonFileWith(name: fileName)!)
        return object
    }
   
    public static func getbjectsFromData<T: Decodable>(type: T.Type, fileName: String) -> [T?]? {
        let objects = try? JSONDecoder().decode([T].self, from: getDataFromJsonFileWith(name: fileName)!)
        return objects
    }
    
}
