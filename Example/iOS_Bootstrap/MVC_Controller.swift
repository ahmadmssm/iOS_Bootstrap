//
//  MVC_Controller.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MVC_Controller : BaseController<MVC_View> {
    
    override init(view: MVC_View) {
        super.init(view: view)
        // You can call any function for your view using the ready presented variable : getView
    }

}

