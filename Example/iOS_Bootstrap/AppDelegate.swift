//
//  AppDelegate.swift
//  iOS_Bootstrap
//
//  Created by ams.eng@hotmail.com on 06/08/2018.
//  Copyright (c) 2018 ams.eng@hotmail.com. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    private var appDelegateServices: [UIApplicationDelegate] = [AppDefaultConfigs(), NetworkMonitoring()]
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        appDelegateServices.forEach { appDelegateService in
            _ = appDelegateService.application?(application,
                                                didFinishLaunchingWithOptions: launchOptions)
        }
        self.startInitialViewController()
        return true
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        appDelegateServices.forEach { appDelegateService in
            _ = appDelegateService.applicationDidBecomeActive?(application)
        }
    }
          
    func applicationWillResignActive(_ application: UIApplication) {
        appDelegateServices.forEach { appDelegateService in
            _ = appDelegateService.applicationWillResignActive?(application)
        }
    }
    
    private func startInitialViewController() {
        let navigator: Navigator = resolver.resolve()
        navigator.startInitialViewController()
    }
}
