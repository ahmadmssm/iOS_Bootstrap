//
//  User.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/29/18.
//

import HandyJSON

open class User: Codable, HandyJSON, UserDefaultsService {
    
    public var id : String?
    public var itemsPerPage : Int?
    
    
    
    required public init() {}
    
    public final func cache() {
        getUserDefaults.setObjectWithKey(value: self, key: "UserProfile_0")
    }
    
    public final func cacheWithKey(key : String) {
        getUserDefaults.setObjectWithKey(value: self, key: key)
    }
  
    
    public final func getCachedUser() -> User? {
        return getUserDefaults.getObjectWithKey(key: "UserProfile_0")
    }
    
    public final func getCachedUserWithKey(key : String) -> User? {
        return getUserDefaults.getObjectWithKey(key: key)
    }
}
