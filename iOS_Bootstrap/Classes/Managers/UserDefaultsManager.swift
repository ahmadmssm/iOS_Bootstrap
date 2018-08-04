//
//  SharedPreferenceKeys.swift
//  Swift job
//
//  Created by Mivors on 10/31/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import Foundation

open class UserDefaultsManager {
    
    private let prefFile = UserDefaults.standard
    
    public init() {}
    
    public func getBooleanValueWithKey(_ key : String) -> Bool {
        return prefFile.bool(forKey: key)
    }
    
    public func getStringValueWithKey(_ key : String) -> String {
        if let value : String = prefFile.string(forKey: key) { return value }
        return ""
    }
    
    public func getDoubleValueWithKey(_ key : String) -> Double {
        return prefFile.double(forKey: key)
    }
    
    public func getIntegerValueWithKey(_ key : String) -> Int {
        return prefFile.integer(forKey: key)
    }
    
    
    public func getArrayWithKey(_ key : String) -> [String] {
        if let value : [String] = prefFile.array(forKey: key) as! [String]? { return value }
        return [""]
    }
    
    public func getObjectValueWithKey(_ key : String) -> AnyObject {
        if let value : AnyObject = prefFile.object(forKey: key) as AnyObject? { return value }
        return "" as AnyObject
    }
    
    
    public func setStringValueWithKey(_ value : String, key : String) {
        prefFile.set(value, forKey: key)
        prefFile.synchronize()
    }
    
    public func setBooleanValueWithKey(_ value : Bool, key : String) {
        prefFile.set(value, forKey: key)
        prefFile.synchronize()
    }
    public func setIntegerWithKey(_ value : Int, key : String) {
        prefFile.set(value, forKey: key)
        prefFile.synchronize()
    }
    
    public func setArrayValueWithKey(_ value : [String], key : String) {
        prefFile.set(value, forKey: key)
        prefFile.synchronize()
    }
    
    public func setObjectValueWithKey(_ value : AnyObject, key : String) {
        prefFile.set(value, forKey: key)
        prefFile.synchronize()
    }

}
