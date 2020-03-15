//
//  SharedPreferenceKeys.swift
//  Swift job
//
//  Created by Mivors on 10/31/16.
//  Copyright © 2016 Mivors. All rights reserved.
//

import Foundation

public class UserDefaultsManager {
    
    private let defaults: UserDefaults
    public init() { defaults = UserDefaults.standard }
    
    func getUserDefaults() -> UserDefaults { return defaults }
    
    open func setBooleanWithKey(value: Bool, key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func setBooleanWithKey<T: RawRepresentable>(value: Bool, key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func getBooleanWithKey(key: String) -> Bool {
        return defaults.bool(forKey: key)
    }
    
    open func getBooleanWithKey<T: RawRepresentable>(key: T) -> Bool where T.RawValue == String {
        return defaults.bool(forKey: key.rawValue)
    }
    
    open func setStringWithKey<T: RawRepresentable>(value: String, key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func setStringWithKey(value: String, key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func getStringWithKey(key: String) -> String {
        if let value : String = defaults.string(forKey: key) { return value }
        return ""
    }
   
    open func getStringWithKey<T: RawRepresentable>(key: T) -> String where T.RawValue == String {
        if let value : String = defaults.string(forKey: key.rawValue) { return value }
        return ""
    }
    
    open func setDoubleWithKey<T: RawRepresentable>(value: Double, key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func setDoubleWithKey(value: Double, key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func getDoubleWithKey(key: String) -> Double { return defaults.double(forKey: key) }
    
    open func getDoubleWithKey<T: RawRepresentable>(key: T) -> Double where T.RawValue == String { return defaults.double(forKey: key.rawValue) }
    
    open func setIntegerWithKey(value: Int, key : String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func setIntegerWithKey<T: RawRepresentable>(value: Int, key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func getIntegerWithKey(key: String) -> Int { return defaults.integer(forKey: key) }

    public final func getIntegerWithKey <T: RawRepresentable>(key: T) -> Int where T.RawValue == String {
        return defaults.integer(forKey: key.rawValue) }
    
    
    open func setArrayWithKey<O, T: RawRepresentable>(value: [O], key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func setArrayWithKey<O>(value: [O], key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func setArrayWithKey(value: [AnyObject], key: String) {
        defaults.set(value, forKey: key)
        defaults.synchronize()
    }
    
    open func setArrayWithKey<T: RawRepresentable>(value: [AnyObject], key: T) where T.RawValue == String {
        defaults.set(value, forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func getArrayWithKey(key: String) -> [AnyObject] {
        if let value : [AnyObject] = defaults.array(forKey: key) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    open func getArrayWithKey <T: RawRepresentable>(key : T) -> [AnyObject] where T.RawValue == String {
        if let value : [AnyObject] = defaults.array(forKey: key.rawValue) as [AnyObject]? { return value }
        return [] as [AnyObject]
    }
    
    open func getArrayWithKey<T>(key: String) -> [T] {
        if let value: [T] = defaults.array(forKey: key) as? [T] {
            return value
        }
        return [] as [T]
    }
    
    open func getArrayWithKey <O, T: RawRepresentable>(key: T) -> [O] where T.RawValue == String {
        if let value : [O] = defaults.array(forKey: key.rawValue) as? [O] { return value }
        return [] as [O]
    }
    
    open func setObjectWithKey<O: Codable, T: RawRepresentable>(value : O, key: T) where T.RawValue == String {
        defaults.set(try? PropertyListEncoder().encode(value), forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func setObjectWithKey<O: Codable>(value : O, key : String) {
        defaults.set(try? PropertyListEncoder().encode(value), forKey: key)
        defaults.synchronize()
    }
    
    open func getObjectWithKey<O: Codable>(object type: O.Type, key: String) -> O? {
        do {
            if let data = defaults.object(forKey: key) {
                let decoder = PropertyListDecoder()
                return try decoder.decode(O.self, from: data as! Data)
            }
            return nil
        }
        catch { print(error) }
        return nil
    }
    
    open func getObjectWithKey <O: Codable, T: RawRepresentable>(object type: O.Type, key: T) -> O? where T.RawValue == String {
        do {
            if let data = defaults.object(forKey: key.rawValue) {
                let decoder = PropertyListDecoder()
                return try decoder.decode(O.self, from: data as! Data)
            }
            return nil
        }
        catch { print(error) }
        return nil
    }
    
    open func deleteSavedValueWithKey<T: RawRepresentable>(key: T)
        where T.RawValue == String {
        defaults.removeObject(forKey: key.rawValue)
        defaults.synchronize()
    }
    
    open func deleteSavedValueWithKey(key: String) {
        defaults.removeObject(forKey: key)
        defaults.synchronize()
    }
    
    open func resetUserDefaults() {
        defaults.removePersistentDomain(forName: Bundle.main.bundleIdentifier!)
        defaults.synchronize()
    }
}
