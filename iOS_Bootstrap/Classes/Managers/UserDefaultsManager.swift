//
//  SharedPreferenceKeys.swift
//  Swift job
//
//  Created by Mivors on 10/31/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import Foundation

open class UserDefaultsManager {
    
    private let defaults : UserDefaults
    public init() { defaults = UserDefaults.standard }
    
    public func setBooleanWithKey(value : Bool, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getBooleanWithKey(key : String) -> Bool { return defaults.bool(forKey: key) }
    
    public func setStringWithKey(value : String, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getStringWithKey(key : String) -> String {
        if let value : String = defaults.string(forKey: key) { return value }
        return ""
    }
    
    public func getDoubleWithKey(key : String) -> Double { return defaults.double(forKey: key) }
    
    public func setIntegerWithKey(value : Int, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getIntegerWithKey(key : String) -> Int { return defaults.integer(forKey: key) }
    
    public func setArrayWithKey<T>(value : [T], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setArrayWithKey(value : [AnyObject], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getArrayWithKey(key : String) -> [AnyObject] {
        if let value : [AnyObject] = defaults.array(forKey: key) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    public func getArrayWithKey<T>(key : String) -> [T] {
        if let value : [T] = defaults.array(forKey: key)! as? [T] { return value }
        return [] as [T]
    }
    
    public func setObjectWithKey(value : AnyObject, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setObjectWithKey<T>(value : T, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getObjectWithKey(key : String) -> AnyObject? {
        if let value = defaults.object(forKey: key) { return value as AnyObject }
        return nil
    }
    
    public func getObjectWithKey<T>(key : String) -> T? {
        if let value = defaults.object(forKey: key) { return value as? T }
        return nil
    }

}
