//
//  TrendingMoviesAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesAPI: AppAPI {
    
    private let page: Int
    
    var route: Route { return .get(Endpoints.trendingMovies) }
    var parameters: Parameters? {
            return URLEncoding() => [
                "api_key" : Constants.tmdbAuthKey,
                "page": page
            ]
    }
    
    init(page: Int) {
        self.page = page
    }
}
