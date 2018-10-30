//
//  BaseSideMenuModel.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/29/18.
//

open class BaseSideMenuModel {
    
    public var itemName : String?
    public var itemId : Int?
    
    public init(itemName : String, itemId : Int) {
        self.itemName = itemName
        self.itemId = itemId
    }
    
}
