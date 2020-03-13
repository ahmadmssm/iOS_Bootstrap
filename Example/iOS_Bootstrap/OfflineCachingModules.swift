//
//  OfflineCachingModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Resolver

extension Resolver {
    static func offlineCachingModules() {
        register { CountriesCachingManager() }
        register { ToDoListCachingManager() }
        register { NSCache<NSString, UIImage>() }.scope(application)
    }
}

