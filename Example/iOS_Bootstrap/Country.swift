//
//  Country.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import HandyJSON

struct Country : BaseModel {
    
    var countryName : String?
    var capital : String?
    var region : String?
    var pop : Int?
    var subregion : String?
    var translations : Translations?
    
    mutating func mapping(mapper: HelpingMapper) {
        // Class attribute : Required name , String name (Name between quotes) : Json field name.
        mapper <<< self.countryName <-- "name"
        mapper <<< self.pop <-- "population"
    }
    
}

