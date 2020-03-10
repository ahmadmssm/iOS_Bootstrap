//
//  AppDelegateExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Resolver

// DI
extension AppDelegate: Resolving {}

// + AppWindow
extension AppDelegate {
    static func getAppWindow() -> UIWindow {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window!
    }
}
