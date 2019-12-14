//
//  TrendingMoviesRepo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver

struct TrendingMoviesRepo: Resolving {
    func getTrendingMovies(page: Int) -> Single<MoviesPage> {
        let trendingMoviesAPI: TrendingMoviesAPI = resolver.resolve(args: page)
        return trendingMoviesAPI.requestWithNoAuthentication()
    }
}
