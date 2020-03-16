//
//  UIViewControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

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
}
    
    
    


   

