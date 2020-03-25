//
//  ViewControllerCommonEnv.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/24/18.
//

public protocol ViewControllerCommonEnv: InjectableView,
                                         NetworkObserver
                                         where Self: UIViewController {
    func setupViewWillAppearEssentials()
    func setupViewDidDisappearEssentials()
}

extension ViewControllerCommonEnv {
    
    public func setupViewWillAppearEssentials() {
        setCurrent(viewController: self)
        NetworkConnection.shared.addObserver(self)
    }
                 
    public func setupViewDidDisappearEssentials() {
        NetworkConnection.shared.removeObserver(self)
    }
}


