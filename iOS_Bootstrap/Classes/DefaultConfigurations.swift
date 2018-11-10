//
//  DefaultConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation
import UIKit

open class DefaultConfigurations {
    
    static var snackBar : TTGSnackbar?

    private var notificationContext : Any?

    public init() {}

    @objc private func getTokenFromNotification(notification: NSNotification) {
        if let responseString = notification.userInfo?["response"] as? String {
            let sessionServiceDelegate : SessionService = notificationContext as! SessionService
            sessionServiceDelegate.tokenDidRefresh(response: responseString)
        }
    }
    
    public func enableIQKeyboard() -> DefaultConfigurations {
        KeyboardManager.setupKeyboardManager()
        return self
    }
    
    public func iqKeyboardCanGoNext() -> DefaultConfigurations {
        KeyboardManager.canGoNext()
        return self
    }
    
    public func iqKeyboardCanGoBack() -> DefaultConfigurations {
        KeyboardManager.canGoPrevious()
        return self
    }
    
    public func configureAppWindow(window : UIWindow) -> DefaultConfigurations {
        window.makeKeyAndVisible()
        return self
    }
    
    public func configureSessionService(context : Any) -> DefaultConfigurations {
        // You must make your class (self class) conform to SessionService prototcol or the app will crash
        NotificationCenter.default.addObserver(context, selector: #selector(SessionService.didFailedToRefreshToken), name: .expiredToken, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTokenFromNotification(notification:)), name: .newAuthenticationToken, object: nil)
        //
        notificationContext = context
        return self
    }
    
    /**
     You must call .configureNavigationBarApperance if you want to customize the app navigation bar apperance
     */
    public func configureNavigationBarApperance
        (barColor : UIColor, backButtonColor : UIColor, textApperance : [NSAttributedStringKey : Any]!) -> DefaultConfigurations {
        UINavigationBar.appearance().barTintColor = barColor
        UINavigationBar.appearance().tintColor = backButtonColor
        if (textApperance != nil) {
            UINavigationBar.appearance().titleTextAttributes = textApperance
        }
        return self
    }
    
    public func configureAppWindowWithRootNavigationController(window : UIWindow, navController : UINavigationController) -> DefaultConfigurations {
        // create a basic UIWindow and activate it
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return self
    }
    
    public func configureGlobalSnackBar(snacbBar : TTGSnackbar) -> DefaultConfigurations {
        DefaultConfigurations.snackBar = snacbBar
        return self
    }
   
    public func disableNotchForIphoneX() -> DefaultConfigurations  {
        NotchManager.instance.spread()
        return self
    }
    
    public func build() -> DefaultConfigurations {
        return self
    }
    
}
