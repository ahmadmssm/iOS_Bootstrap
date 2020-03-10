//
//  KeyboardManager.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/16/18.
//  Ref :
// Call the static function in AppDelegate class in the didFinishLaunchingWithOptions function

import IQKeyboardManagerSwift

open class KeyboardManager {
    
    public let iqKeyboardManager = IQKeyboardManager.shared
    
    open func setupKeyboardManager() {
        iqKeyboardManager.enable = true
        iqKeyboardManager.shouldResignOnTouchOutside = true
    }
    
    open func canGoNext() {
        iqKeyboardManager.goNext()
    }

    open func canGoPrevious() {
        iqKeyboardManager.goPrevious()
    }
    
    open func getIQKeyboardManager() -> IQKeyboardManager {
        return iqKeyboardManager
    }
    
    open func disableInViewController(viewController : UIViewController.Type) {
        iqKeyboardManager.disabledDistanceHandlingClasses.append(viewController.self)
    }
    
    open func disableKeyboardToolBar() {
        iqKeyboardManager.enableAutoToolbar = false
    }
    
    open func showTextFieldPlaceholder(enable: Bool) {
        iqKeyboardManager.shouldShowToolbarPlaceholder = enable
    }
}
