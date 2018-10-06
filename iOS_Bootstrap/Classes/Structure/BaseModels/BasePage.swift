//
//  BasePage.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/29/18.
//

import HandyJSON

open class BasePage: Codable, HandyJSON {
    
    public var totalNumberOfItems : Int?
    public var itemsPerPage : Int?

    required public init() {}
}
