//
//  UIViewController.swift
//  DTPagerController
//
//  Created by Admin on 25/02/2018.
//

import Foundation

public extension BaseViewController {
    var pagerController: DTPagerController<BasePresenter<Any>, Any>? {
        get {
            var viewController : UIViewController?
            viewController = self
            
            while viewController != nil {
                if let containerViewController = viewController?.parent as? DTPagerController<BasePresenter<Any>, Any> {
                    return containerViewController
                }
                else {
                    viewController = viewController?.parent
                }
            }
            
            return nil
        }
    }
}
