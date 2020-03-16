//
//  DefaultConfigurations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//


open class DefaultConfigurations {
    
    static var coreDataModelName: String?
    private var notificationContext: Any?
    public let keyboardManager = KeyboardManager()
    // Deafult is false
    private var isInternetConnectionMonitoringEnabled: Bool = false

    public init() {}

    @objc private func getTokenFromNotification(notification: NSNotification) {
        if let responseString = notification.userInfo?["response"] as? String {
            let tokenRefreshDelegate : TokenRefreshService = notificationContext as! TokenRefreshService
            tokenRefreshDelegate.tokenDidRefreshed(response: responseString)
        }
    }
    
    public func enableIQKeyboard() -> DefaultConfigurations {
        keyboardManager.setupKeyboardManager()
        return self
    }
    
    public func iqKeyboardCanGoNext() -> DefaultConfigurations {
        keyboardManager.canGoNext()
        return self
    }
    
    public func iqKeyboardCanGoBack() -> DefaultConfigurations {
        keyboardManager.canGoPrevious()
        return self
    }
    
    public func setNavigationBarColor (barColor: UIColor) -> DefaultConfigurations {
        UINavigationBar.appearance().barTintColor = barColor
        return self
    }
    
    public func setNavigationBarBackButtonColor (backButtonColor: UIColor) -> DefaultConfigurations {
        UINavigationBar.appearance().tintColor = backButtonColor
        return self
    }
    
    public func setNavigationBarTextApperance (textApperance : [NSAttributedStringKey : Any]!) -> DefaultConfigurations {
        UINavigationBar.appearance().titleTextAttributes = textApperance
        return self
    }
   
    public func disableNotchForIphoneX() -> DefaultConfigurations {
        NotchArea.instance.spread()
        return self
    }
    
    open func configureAppWindowWithRootNavigationController(window : UIWindow, navController : UINavigationController) -> DefaultConfigurations {
        // create a basic UIWindow and activate it
        window.rootViewController = navController
        window.makeKeyAndVisible()
        return self
    }
    
    open func configureAppWindow(window : UIWindow) -> DefaultConfigurations {
        window.makeKeyAndVisible()
        return self
    }
    
    open func setTokenRefreshListener(_ context : Any) -> DefaultConfigurations {
        // You must make your class (self class) conform to TokenRefreshService prototcol or the app will crash
        NotificationCenter.default.addObserver(context, selector: #selector(TokenRefreshService.didFailedToRefreshToken), name: .expiredToken, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.getTokenFromNotification(notification:)), name: .newAuthenticationToken, object: nil)
        //
        notificationContext = context
        return self
    }
    
    @discardableResult
    open func setCoreDataModelName(modelName: String) -> DefaultConfigurations {
        DefaultConfigurations.coreDataModelName = modelName
        return self
    }
    
    open func build() -> DefaultConfigurations {
        return self
    }
    
    open func setTabBarSelectedItemCustomColor(_ color: UIColor) -> DefaultConfigurations {
        UITabBar.appearance().tintColor =  color
        return self
    }
    
    open func removeNavigationBackButtonLabel() -> DefaultConfigurations {
        UIBarButtonItem.appearance().setTitleTextAttributes([.foregroundColor: UIColor.clear], for: .normal)
        return self
    }
    
    open func hideKeyboardToolBar() -> DefaultConfigurations {
        keyboardManager.disableKeyboardToolBar()
        return self
    }
   
    open func showTextFieldPlaceholder(enable: Bool) -> DefaultConfigurations {
        keyboardManager.showTextFieldPlaceholder(enable: enable)
        return self
    }
}
