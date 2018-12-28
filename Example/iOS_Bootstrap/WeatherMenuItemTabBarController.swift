//
//  WeatherMenuItemTabBarController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class WeatherMenuItemTabBarController:
                MyMenuItemTabBarController<BasePresenter<BaseViewDelegator>,
                BaseViewDelegator> {
    
    override func initUI() { self.title = "Weather provider" }
    
}
