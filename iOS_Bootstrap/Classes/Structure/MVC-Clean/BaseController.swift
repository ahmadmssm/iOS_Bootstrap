//
//  BaseController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

open class BaseController <V : UIViewController> : UserDefaultsService {
    
    public final var getView: V!
    
    private let userDefaultsManager : UserDefaultsManager!
    
    required public init (view : V) {
        self.getView = view
        userDefaultsManager = UserDefaultsManager()
    }
    
    func detachView() { self.getView = nil }
    
    public func getUserDefaults() -> UserDefaultsManager { return userDefaultsManager }
    
}

