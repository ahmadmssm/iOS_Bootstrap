//
//  SharedPreferenceKeys.swift
//  Swift job
//
//  Created by Mivors on 10/31/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import Foundation

public final class UserDefaultsManager {
    
    private let defaults : UserDefaults
    public init() { defaults = UserDefaults.standard }
    
    public final func setBooleanWithKey(value : Bool, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func setBooleanWithKey<T: RawRepresentable>(value : Bool, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func getBooleanWithKey(key : String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    public final func getBooleanWithKey<T: RawRepresentable>(key : T) -> Bool where T.RawValue == String {
        return defaults.bool(forKey: key.rawValue)
    }
    
    public final func setStringWithKey<T: RawRepresentable>(value : String, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func setStringWithKey(value : String, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func getStringWithKey(key : String) -> String {
        if let value : String = defaults.string(forKey: key) { return value }
        return ""
    }
   
    public final func getStringWithKey<T: RawRepresentable>(key : T) -> String where T.RawValue == String {
        if let value : String = defaults.string(forKey: key.rawValue) { return value }
        return ""
    }
    
    public final func setDoubleWithKey<T: RawRepresentable>(value : Double, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func setDoubleWithKey(value : Double, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func getDoubleWithKey(key : String) -> Double { return defaults.double(forKey: key) }
    
    public final func getDoubleWithKey<T: RawRepresentable>(key : T) -> Double where T.RawValue == String { return defaults.double(forKey: key.rawValue) }
    
    public final func setIntegerWithKey(value : Int, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func setIntegerWithKey<T: RawRepresentable>(value : String, key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func getIntegerWithKey(key : String) -> Int { return defaults.integer(forKey: key) }

    public final func getIntegerWithKey <T: RawRepresentable>(key : T) -> Int where T.RawValue == String {
        return defaults.integer(forKey: key.rawValue) }
    
    
    public final func setArrayWithKey<O, T: RawRepresentable>(value : [O], key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func setArrayWithKey<O>(value : [O], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func setArrayWithKey(value : [AnyObject], key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    public final func setArrayWithKey<T: RawRepresentable>(value : [AnyObject], key : T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func getArrayWithKey(key : String) -> [AnyObject] {
        if let value : [AnyObject] = defaults.array(forKey: key) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    public final func getArrayWithKey <T: RawRepresentable>(key : T) -> [AnyObject] where T.RawValue == String {
        if let value : [AnyObject] = defaults.array(forKey: key.rawValue) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    public final func getArrayWithKey<T>(key : String) -> [T] {
        if let value : [T] = defaults.array(forKey: key)! as? [T] { return value }
        return [] as [T]
    }
    
    public final func getArrayWithKey <O, T: RawRepresentable>(key : T) -> [O] where T.RawValue == String {
        if let value : [O] = defaults.array(forKey: key.rawValue)! as? [O] { return value }
        return [] as [O]
    }
    
    public final func setObjectWithKey<O: Codable, T: RawRepresentable>(value : O, key : T) where T.RawValue == String {
        defaults.set(try? PropertyListEncoder().encode(value), forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func setObjectWithKey<O: Codable>(value : O, key : String) {
        defaults.set(try? PropertyListEncoder().encode(value), forKey: key)
        defaults.synchronize()
    }
    
//    public final func setObjectWithKey<O, T: RawRepresentable>(value : O, key : T) where T.RawValue == String {
//        defaults.set(value, forKey: key.rawValue)
//        defaults.synchronize()
//    }
//
//    public final func setObjectWithKey<T>(value : T, key : String) {
//        defaults.set(value, forKey: key)
//        defaults.synchronize()
//    }
    
    public final func getObjectWithKey<O: Codable>(key : String) -> O? {
        do {
            let data = defaults.object(forKey: key) as! Data
            let decoder = PropertyListDecoder()
            return try decoder.decode(O.self, from: data)
        }
        catch { print(error) }
        return nil
    }
    
    public final func getObjectWithKey <O: Codable, T: RawRepresentable>(key : T) -> O? where T.RawValue == String {
        do {
            let data = defaults.object(forKey: key.rawValue) as! Data
            let decoder = PropertyListDecoder()
            return try decoder.decode(O.self, from: data)
        }
        catch { print(error) }
        return nil
    }
    
    public final func getObjectWithKey<T>(key : String) -> T? {
        if let value = defaults.object(forKey: key) { return value as? T }
        return nil
    }

    public final func getObjectWithKey<O, T: RawRepresentable>(key : T) -> O? where T.RawValue == String {
        if let value = defaults.object(forKey: key.rawValue) { return value as? O }
        return nil
    }
    
    public final func deleteSavedValueWithKey<T: RawRepresentable>(key : T) where T.RawValue == String {
        defaults.removeObject(forKey: key.rawValue)
        defaults.synchronize()
    }
    
    public final func deleteSavedValueWithKey(key : String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    public final func resetUserDefaults() {
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        defaults.synchronize()
    }
    
}
