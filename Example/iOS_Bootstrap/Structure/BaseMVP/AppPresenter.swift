//
//  AppPresenter.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/20/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import Resolver
import iOS_Bootstrap

class AppPresenter<V>: BasePresenter<V> {
    
    func postError(errorMessage: String) {
        if let viewDelegate = self.getViewDelegate() as? AppViewDelegate {
            viewDelegate.hideLoading()
            viewDelegate.didGetError(errorMessage: errorMessage)
        }
    }
}
