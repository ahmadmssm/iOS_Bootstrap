//
//  Endpoints.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

// enums cannot be instantiated
enum Endpoints {
    static let refreshToken = "/refresh/"
    static let worldCountries = "all"
    static let trendingMovies = "movie/popular"
    static let devicePublicIP = "?format=json2"
    static let locationCoordinates = "/"
    static let fiveDaysWeatherForcast = "/forecast"
}
