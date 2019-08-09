//
//  GetTrendingMovies.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class GetTrendingMovies: AppAPI<MoviesPage> {
    
    private let page: Int
    
    override var baseURL: URL { return "https://api.themoviedb.org/3/".toURL() }
    override var route: Route { return .get("movie/popular") }
    override var parameters: Parameters? {
        return URLEncoding() => [
            "api_key" : Constants.tmdbAuthKey,
            "page": page
        ]
    }
    
    init(page: Int) {
        self.page = page
    }
}
