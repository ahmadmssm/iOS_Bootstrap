//
//  UnitTestingAppDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

@objc(UnitTestingAppDelegate)
class UnitTestingAppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        return true
    }
}
