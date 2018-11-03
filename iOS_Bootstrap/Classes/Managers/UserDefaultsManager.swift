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
    
    public func setBooleanWithKey<T: RawRepresentable>(value : Bool, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func getBooleanWithKey(key : String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    public func getBooleanWithKey<T: RawRepresentable>(key : T) -> Bool where T.RawValue == String {
        return defaults.bool(forKey: key.rawValue)
    }
    
    public func setStringWithKey<T: RawRepresentable>(value : String, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func setStringWithKey(value : String, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getStringWithKey(key : String) -> String {
        if let value : String = defaults.string(forKey: key) { return value }
        return ""
    }
   
    public func getStringWithKey<T: RawRepresentable>(key : T) -> String where T.RawValue == String {
        if let value : String = defaults.string(forKey: key.rawValue) { return value }
        return ""
    }
    
    public func setDoubleWithKey<T: RawRepresentable>(value : Double, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func setDoubleWithKey(value : Double, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func getDoubleWithKey(key : String) -> Double { return defaults.double(forKey: key) }
    
    public func getDoubleWithKey<T: RawRepresentable>(key : T) -> Double where T.RawValue == String { return defaults.double(forKey: key.rawValue) }
    
    public func setIntegerWithKey(value : Int, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setIntegerWithKey<T: RawRepresentable>(value : String, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func getIntegerWithKey(key : String) -> Int { return defaults.integer(forKey: key) }

    public func getIntegerWithKey <T: RawRepresentable>(key : T) -> Int where T.RawValue == String {
        return defaults.integer(forKey: key.rawValue) }
    
    
    public func setArrayWithKey<O, T: RawRepresentable>(value : [O], key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func setArrayWithKey<O>(value : [O], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setArrayWithKey(value : [AnyObject], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setArrayWithKey<T: RawRepresentable>(value : [AnyObject], key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func getArrayWithKey(key : String) -> [AnyObject] {
        if let value : [AnyObject] = defaults.array(forKey: key) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    public func getArrayWithKey <T: RawRepresentable>(key : T) -> [AnyObject] where T.RawValue == String {
        if let value : [AnyObject] = defaults.array(forKey: key.rawValue) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    public func getArrayWithKey<T>(key : String) -> [T] {
        if let value : [T] = defaults.array(forKey: key)! as? [T] { return value }
        return [] as [T]
    }
    
    public func getArrayWithKey <O, T: RawRepresentable>(key : T) -> [O] where T.RawValue == String {
        if let value : [O] = defaults.array(forKey: key.rawValue)! as? [O] { return value }
        return [] as [O]
    }
    
    public func setObjectWithKey<T: RawRepresentable>(value : AnyObject, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public func setObjectWithKey(value : AnyObject, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public func setObjectWithKey<O, T: RawRepresentable>(value : O, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
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
    
    public func getObjectWithKey <T: RawRepresentable>(key : T) -> AnyObject? where T.RawValue == String {
        if let value = defaults.object(forKey: key.rawValue) { return value as AnyObject }
        return nil
    }
    
    public func getObjectWithKey<T>(key : String) -> T? {
        if let value = defaults.object(forKey: key) { return value as? T }
        return nil
    }

    public func getObjectWithKey<O, T: RawRepresentable>(key : T) -> O? where T.RawValue == String {
        if let value = defaults.object(forKey: key.rawValue) { return value as? O }
        return nil
    }
    
}
