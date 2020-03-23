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
    
    open func configureAppWindowWithRootNavigationController(window : UIWindow, viewController : UIViewController) -> DefaultConfigurations {
        // create a basic UIWindow and activate it
        window.rootViewController = viewController
        window.makeKeyAndVisible()
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
