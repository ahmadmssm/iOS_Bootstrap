//
//  KeyboardManager.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/16/18.
//  Ref :
// Call the static function in AppDelegate class in the didFinishLaunchingWithOptions function


import IQKeyboardManagerSwift

open class KeyboardManager {
    
    public static let iqKeyboardManagerInstanace = IQKeyboardManager.sharedManager()
    
    public static func handleKeyboardManager() {
        iqKeyboardManagerInstanace.enable = true
        iqKeyboardManagerInstanace.shouldResignOnTouchOutside = true
    }
    
    public static func canGoNext() {
        iqKeyboardManagerInstanace.goNext()
    }

    public static func canGoPrevious() {
        iqKeyboardManagerInstanace.goPrevious()
    }
    
    public static func getIQKeyboardManager() -> IQKeyboardManager {
        return iqKeyboardManagerInstanace
    }
    
    public static func disableInViewController(viewController : UIViewController.Type) {
        iqKeyboardManagerInstanace.disabledDistanceHandlingClasses.append(viewController.self)
    }
}
