//
//  Translations.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/1/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import HandyJSON

struct Translations : BaseModel {
    
    var german : String?
    var es : String?
    var french: String?
    var japanese : String?
    var italian : String?
    var br : String?
    var portuguese : String?
    var nl : String?
    var hr : String?
    var fa : String?
    
    mutating func mapping(mapper: HelpingMapper) {
        mapper <<< self.german <-- "de"
        mapper <<< self.french <-- "fr"
        mapper <<< self.italian <-- "it"
        mapper <<< self.japanese <-- "ja"
        mapper <<< self.portuguese <-- "pt"
    }
    
}
