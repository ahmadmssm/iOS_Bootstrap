//
//  BaseUser.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/29/18.
//
//

open class BaseUser: Codable {
    
    public var id : String?
    public var isLoggedIn : Bool?
    public private(set) var userkKey = "_UserProfile"
 
    public init() {}
    
    open func save() {}
    
    open func saveWith(key : String) {}
    
    open class func get() -> Self? {
         fatalError("`get()` function should be implemented.")
    }
    
    open class func getWith(key: String) -> Self? {
         fatalError("`getWith(key: String)` function should be implemented.")
    }
    
    open class func delete() {}
}

