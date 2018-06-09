//
//  Parser.swift
//
//  Created by Ahmad Mahmoud on 4/13/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//

import HandyJSON

open class Parser {
    
    public static func objectFromJSONstring<T : HandyJSON>(object: T.Type, JSONString : String) -> T? {
        if let obj = object.deserialize(from: JSONString) { return obj }
        return nil
    }

    public static func subObjectFromJSONstring<T : HandyJSON>(object: T.Type, JSONString: String, objectPath: String) -> T? {
        if let obj = object.deserialize(from: JSONString, designatedPath: objectPath) { return obj }
        return nil
    }
  
    public static func arrayOfObjectsFromJSONstring<T : HandyJSON>(object : T.Type, JSONString: String) -> [T?]? {
        if let obj = [T].deserialize(from: JSONString) { return obj }
        return nil
    }
    
    public static func arrayOfObjectsFromJSONstring<T : HandyJSON>(object : T.Type, JSONString: String, arrayPath: String) -> [T?]? {
        if let obj = [T].deserialize(from: JSONString, designatedPath: arrayPath) { return obj }
        return nil
    }
    
    public static func objectFromDictionary<T : HandyJSON>(object: T.Type, dictionary : Dictionary<String, Any>) -> T? {
        if let obj = object.deserialize(from: dictionary) { return obj }
        return nil
    }
    
    public static func objectToDictionary<T : HandyJSON>(object: T) -> Dictionary<String, Any>? {
        if let obj = object.toJSON() { return obj }
        return nil
    }
    
    public static func objectToJSONstring<T : HandyJSON>(object: T) -> String? {
        if let str = object.toJSONString() { return str }
        return nil
    }
    
    public static func objectToString <T : HandyJSON>(object: T) -> String? {
       return objectToJSONstring(object: object)
    }
}





