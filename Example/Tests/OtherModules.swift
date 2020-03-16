//
//  OtherModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Resolver

extension Resolver {
    static func otherModules() {
        register { LanguageManager() }
    }
}
