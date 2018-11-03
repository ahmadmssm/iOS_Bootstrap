//
//  BaseUser.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/29/18.
//

import HandyJSON

open class BaseUser: Codable, HandyJSON, UserDefaultsService {
    
    public var id : String?
    public var email:String!
    public var createdAt:String!
    public var updatedAt:String!
    public var isLoggedIn : Bool?
    public var hasValidSession : Bool?

    required public init() {}
    
    
    public final func cache() {
        getUserDefaults().setObjectWithKey(value: self, key: "UserProfile_0")
    }
    
    public final func cacheWithKey(key : String) {
        getUserDefaults().setObjectWithKey(value: self, key: key)
    }
    
    public final func getCachedUser() -> BaseUser? {
        return getUserDefaults().getObjectWithKey(key: "UserProfile_0")
    }
    
    public final func getCachedUserWithKey(key : String) -> BaseUser? {
        return getUserDefaults().getObjectWithKey(key: key)
    }
}
