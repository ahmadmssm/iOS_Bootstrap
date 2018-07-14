//
//  GlobalConfiguration.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

open class GlobalConfiguration {
    
    public static func setMainConfigurations ()  {
        KeyboardManager.handleKeyboardManager()
    }
    
    static func configureAppWindow() {
        
    }
    
    public static func configureNavigationBarApperance
        (barColor : UIColor, backButtonColor : UIColor, textApperance : [NSAttributedStringKey : Any]!) {
        UINavigationBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().tintColor = backButtonColor
        if (textApperance != nil) {
            UINavigationBar.appearance().titleTextAttributes = textApperance
        }
    }
}
