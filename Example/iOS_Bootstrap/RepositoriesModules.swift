//
//  RepositoriesModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Resolver

extension Resolver {
    static func repositoriesModules() {
        register { TrendingMoviesRepo() }
        register { Repo() }.scope(application)
    }
}
