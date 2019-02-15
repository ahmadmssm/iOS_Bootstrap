//
//  KeyboardManager.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/16/18.
//  Ref :
// Call the static function in AppDelegate class in the didFinishLaunchingWithOptions function

import IQKeyboardManagerSwift

open class KeyboardManager {
    
    private static let iqKeyboardManagerInstanace = IQKeyboardManager.shared
    
    static func setupKeyboardManager() {
        iqKeyboardManagerInstanace.enable = true
        iqKeyboardManagerInstanace.shouldResignOnTouchOutside = true
    }
    
    static func canGoNext() {
        iqKeyboardManagerInstanace.goNext()
    }

    static func canGoPrevious() {
        iqKeyboardManagerInstanace.goPrevious()
    }
    
    public static func getIQKeyboardManager() -> IQKeyboardManager {
        return iqKeyboardManagerInstanace
    }
    
    public static func disableInViewController(viewController : UIViewController.Type) {
        iqKeyboardManagerInstanace.disabledDistanceHandlingClasses.append(viewController.self)
    }
    
    public static func disableKeyboardToolBar() {
        iqKeyboardManagerInstanace.enableAutoToolbar = false
    }
    
    public static func showTextFieldPlaceholder(enable: Bool) {
        iqKeyboardManagerInstanace.shouldShowTextFieldPlaceholder = enable
    }
    
}
