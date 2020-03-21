//
//  BaseModel.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/20/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import Realm
import RealmSwift

class BaseModel: BaseRealmModel, Decodable {
    
    required init() { super.init() }
    
    required init(from decoder: Decoder) {
        super.init()
    }
}
