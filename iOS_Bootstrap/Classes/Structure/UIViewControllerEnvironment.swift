//
//  UIViewControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

public protocol InternetConnectionServiceMonitoring {
    func networkStatusDidChange(isConnected: Bool)
}

extension UIViewController: ViewControllerCommonFeatures {
    
    private struct AssociatedKeys {
        static var networkConnectionType = "networkConnectionType"
    }
    
    var networkConnectionType: Reachability.Connection? {
        get {
            return getAssociatedObject(object: self, associativeKey: &AssociatedKeys.networkConnectionType)
        }
        set {
            if let value = newValue {
                setAssociatedObject(object: self, value: value, associativeKey: &AssociatedKeys.networkConnectionType, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    
    func setupViewWillAppearEssentials() {
        setCurrent(viewController: self)
    }
    
    func setupViewDidDisappearEssentials() {}
    
    public final func getNetworkConnectionType() -> Reachability.Connection {
        return networkConnectionType!
    }
    
    public func networkStatusDidChange(status: Reachability.Connection) {
        networkConnectionType = status
        if (status == .none) {
            self.networkStatusDidChange(isConnected: false)
        }
        else if (status == .wifi || status == .cellular) {
            self.networkStatusDidChange(isConnected: true)
        }
    }
    
    @objc open func networkStatusDidChange(isConnected: Bool) {

    }
}
    
    
    


   

