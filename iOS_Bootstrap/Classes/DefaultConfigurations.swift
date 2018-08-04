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
    
    private static var notificationContext : Any?
    
    public static func setMandatoryConfigurations ()  {
        KeyboardManager.handleKeyboardManager()
    }
    
    /**
     You must call .configureNavigationBarApperance if you want to customize the app navigation bar apperance
     */
    public static func configureAppWindow(window : UIWindow) {
        window.makeKeyAndVisible()
    }
    
    public static func configureAppWindowWithRootNavigationController(window : UIWindow, navController : UINavigationController) {
        // create a basic UIWindow and activate it
        // let window : UIWindow = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = navController
        window.makeKeyAndVisible()
    }
    
    public static func configureSessionService(context : Any) {
        // You must make your class (self class) conform to SessionService prototcol or the app will crash
        NotificationCenter.default.addObserver(context, selector: #selector(SessionService.didFailedToRefreshToken), name: .expiredToken, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTokenFromNotification(notification:)), name: .newAuthenticationToken, object: nil)
        //
        notificationContext = context
    }
    
    @objc private static func getTokenFromNotification(notification: NSNotification) {
        if let responseString = notification.userInfo?["response"] as? String {
            let sessionServiceDelegate : SessionService = notificationContext as! SessionService
            sessionServiceDelegate.tokenDidRefresh(response: responseString)
        }
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
