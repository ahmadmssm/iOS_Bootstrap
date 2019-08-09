//
//  BaseRealmModel.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/21/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import Realm
import RealmSwift

@objcMembers
class BaseRealmModel: Object {
    
    required init() { super.init() }
    
    required init(value: Any, schema: RLMSchema) {
        super.init(value: value, schema: schema)
    }
    
    required init(realm: RLMRealm, schema: RLMObjectSchema) {
        super.init(realm: realm, schema: schema)
    }
}
