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
    
    // Helper variables
    static var snackBar: TTGSnackbar?
    private var notificationContext: Any?
    static var coreDataModelName: String?

    public init() {}

    @objc private func getTokenFromNotification(notification: NSNotification) {
        if let responseString = notification.userInfo?["response"] as? String {
            let tokenRefreshDelegate : TokenRefreshService = notificationContext as! TokenRefreshService
            tokenRefreshDelegate.tokenDidRefreshed(response: responseString)
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
    
    public func setTokenRefreshListener(_ context : Any) -> DefaultConfigurations {
        // You must make your class (self class) conform to TokenRefreshService prototcol or the app will crash
        NotificationCenter.default.addObserver(context, selector: #selector(TokenRefreshService.didFailedToRefreshToken), name: .expiredToken, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTokenFromNotification(notification:)), name: .newAuthenticationToken, object: nil)
        //
        notificationContext = context
        return self
    }
    
    public func setNavigationBarColor (barColor : UIColor) -> DefaultConfigurations {
        UINavigationBar.appearance().barTintColor = barColor
        return self
    }
    
    public func setNavigationBarBackButtonColor (backButtonColor : UIColor) -> DefaultConfigurations {
        UINavigationBar.appearance().tintColor = backButtonColor
        return self
    }
    
    public func setNavigationBarTextApperance (textApperance : [NSAttributedStringKey : Any]!) -> DefaultConfigurations {
        UINavigationBar.appearance().titleTextAttributes = textApperance
        return self
    }
    
    public func configureAppWindowWithRootNavigationController(window : UIWindow, navController : UINavigationController) -> DefaultConfigurations {
        // create a basic UIWindow and activate it
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return self
    }
    
    public func configureAppSnackBar(snacbBar : TTGSnackbar) -> DefaultConfigurations {
        DefaultConfigurations.snackBar = snacbBar
        return self
    }
   
    public func disableNotchForIphoneX() -> DefaultConfigurations {
        NotchArea.instance.spread()
        return self
    }
    
    public func setCoreDataModelName(modelName: String) -> DefaultConfigurations {
        DefaultConfigurations.coreDataModelName = modelName
        return self
    }
    
    public func build() -> DefaultConfigurations {
        return self
    }
    
}
