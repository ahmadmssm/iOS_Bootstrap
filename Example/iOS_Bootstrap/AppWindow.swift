//
//  App window.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 1/16/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension AppDelegate {
    static func getAppWindow() -> UIWindow {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.window!
    }
}
