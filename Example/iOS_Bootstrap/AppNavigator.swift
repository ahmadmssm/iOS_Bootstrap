//
//  AppNavigator.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/20/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class AppNavigator: BaseNavigator {
    
    override static func getAppWindow() -> UIWindow? {
        return AppDelegate.getAppWindow()
    }
    
    static func openWithAnimationNoNavigationController(viewController: UIViewController) {
        super.animateAndOpen(viewController: viewController)
        push(viewController: navigationController!)
    }
    
    static func setRootViewControllerAndPresent(_ viewController: UIViewController) {
        set(rootViewController: viewController)
        present(viewController: navigationController!)
    }
}

