//
//  BaseUser.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/29/18.
//
//

open class BaseUser: Codable {
    
    public var id : String?
    public var email:String!
    public var createdAt:String!
    public var updatedAt:String!
    public var isLoggedIn : Bool?
    //
    private static let appId : String = Bundle.main.appId()
    static let userDefaults : UserDefaultsManager = UserDefaultsManager()
    
    required public init() {}
    
    public final func cacheUser() {
        BaseUser.userDefaults.setObjectWithKey(value: self, key: BaseUser.appId + "_UserProfile")
    }
    
    public final func cacheUserWithKey(key : String) {
        BaseUser.userDefaults.setObjectWithKey(value: self, key: key)
    }
    
    public static func getCachedUser() -> BaseUser.Type {
        return userDefaults.getObjectWithKey(key: appId + "_UserProfile")!
    }
    
    public static func getCachedUserWithKey(key : String) -> BaseUser.Type? {
        return userDefaults.getObjectWithKey(key: key)
    }
    
    public static func clearCachedUser() {
        userDefaults.deleteSavedValueWithKey(key: appId + "_UserProfile")
    }
    
    public static func clearCachedUserWithKey(key : String) {
        userDefaults.deleteSavedValueWithKey(key: key)
    }
    
}

