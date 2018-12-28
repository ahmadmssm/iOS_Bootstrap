//
//  BaseSideMenuController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/28/18.
//

open class BaseSideMenuController : SlideMenuController {
    
    open override func initView() {
        configureMenuPropsIfNeeded()
        super.initView()
    }
    
    open func getVisableViewController() -> UIViewController? {
        if var topController = UIApplication.shared.keyWindow?.rootViewController {
            while let presentedViewController = topController.presentedViewController {
                topController = presentedViewController
            }
            return topController
        }
        return nil
    }
    
    open func configureMenuPropsIfNeeded() {
        SlideMenuOptions.hideStatusBar = false
        SlideMenuOptions.contentViewScale = 1
    }
    
}
