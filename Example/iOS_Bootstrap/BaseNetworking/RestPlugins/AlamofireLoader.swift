//
//  AlamofireLoader.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/20/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class AlamofireLoader: LoadingIndicatorService {
    
    func showLoader() {
        EZLoadingActivity.show("loading".localized(), disableUI: true)
    }
    
    func hideLoader() {
        EZLoadingActivity.hide()
    }
}
