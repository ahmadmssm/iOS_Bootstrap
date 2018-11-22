//
//  IServices.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/28/18.
//

public protocol UserDefaultsService : IServicesInstances {}
public extension UserDefaultsService {
    public func getUserDefaults() -> UserDefaultsManager {
        return servicesInstaces.userDefaultsManagerInstance
    }
}
//
public protocol SessionService : IServicesInstances {}
public extension SessionService {
    func getSession() -> SessionManager { return servicesInstaces.sessionManagerInstance }
}
//
public protocol AppDelegateService : TokenRefreshService, UserDefaultsService {}
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


