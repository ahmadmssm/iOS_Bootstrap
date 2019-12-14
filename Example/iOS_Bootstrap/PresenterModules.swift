//
//  PresenterModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
//  Ref: https://github.com/hmlongco/Resolver/blob/master/Documentation/Arguments.md

import Resolver

extension Resolver {
    static func presenterModules() {
        register { (_, arg) -> TrendingMoviesPresenter in
            let viewDelegate = arg as! TrendingMoviesViewDelegate
            return TrendingMoviesPresenter(viewDelegator: viewDelegate, trendingMoviesRepo: resolve())
        }
    }
}
