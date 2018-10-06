//
//  BaseController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

open class BaseController<V> : UserDefaultsService {
    
    public var getView : V!
// public let getUserDefaults : UserDefaultsManager!
    
    public init(view : V) {
        getView = view
     //   getUserDefaults = UserDefaultsManager()
    }
    
    deinit { self.getView = nil }

    open func logOut() {}

}




