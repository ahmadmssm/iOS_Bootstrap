//
//  ExampleMenuModel.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ExampleMenuModel : BaseSideMenuModel {
    var icon : UIImage?
    
    init(itemName : String, itemId : Int, itemIcon : UIImage) {
        super.init(itemName: itemName, itemId: itemId)
        self.icon = itemIcon
    }
}
