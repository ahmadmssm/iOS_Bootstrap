//
//  BaseController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

open class BaseController<V> {
    
    public var getView : V!
    public let getUserDefaults : UserDefaultsManager!
    
    public init(view : V) {
        getView = view
        getUserDefaults = UserDefaultsManager()
    }

    func detachView() { self.getView = nil }

}




