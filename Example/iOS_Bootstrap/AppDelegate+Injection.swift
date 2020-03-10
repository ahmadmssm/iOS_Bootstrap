//
//  AppDelegate+Injection.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
//  Ref: https://github.com/hmlongco/Resolver/blob/master/Documentation/Registration.md

import Resolver

extension Resolver: ResolverRegistering {
    public static func registerAllServices() {
        Resolver.defaultScope = Resolver.unique
        //
        presenterModules()
        restModules()
        repositoriesModules()
        offlineCachingModules()
        AdapterModules()
        otherModules()
    }
}
