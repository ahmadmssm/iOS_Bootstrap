//
//  CustomViewsPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/3/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CustomViewsPresenter: BasePresenter<CustomViewsDelegator> {
    required init(viewDelegator: CustomViewsDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
}
