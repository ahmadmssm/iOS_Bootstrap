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
        register { (resolver, args) -> TrendingMoviesPresenter in
            let viewDelegate: TrendingMoviesViewDelegate = resolver.arg(from: args!)!
            return TrendingMoviesPresenter(viewDelegate: viewDelegate, trendingMoviesRepo: resolve())
        }
        register { (resolver, args) -> ToDoPresenter in
            let viewDelegate: ToDoViewDelegate = resolver.arg0(from: args!)!
            let mode: ToDoMode = resolver.arg1(from: args!)!
            return ToDoPresenter(viewDelegate: viewDelegate, mode: mode)
        }
    }
}
