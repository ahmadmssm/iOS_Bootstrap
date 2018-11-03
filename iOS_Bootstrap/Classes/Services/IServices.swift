//
//  IServices.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/28/18.
//

// Parent service
public protocol UserDefaultsService : IServicesInstances {}

// Child services
public protocol AppDelegateService : SessionService, UserDefaultsService {}
//
public extension UserDefaultsService {
    public func getUserDefaults() -> UserDefaultsManager {
        return servicesInstaces.userDefaultsManagerInstance
    }
}
//
public protocol Injectable : IServicesInstances {
    func setContext(context : UIViewController)
}
public extension Injectable {
    public func setContext(context : UIViewController) { ServicesInstances.context = context }
}
//
public protocol ContextService : IServicesInstances {
    static func getContext() -> UIViewController
}
public extension ContextService {
    public static func getContext() -> UIViewController { return ServicesInstances.context! }
}

public protocol BaseConstants : BuildVariantService {}


