//
//  RestModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
//  Ref: https://github.com/hmlongco/Resolver/blob/master/Documentation/Arguments.md

import Resolver

extension Resolver {
    static func restModules() {
        register { RefreshTokenAPI() }
        register { WorldCountriesAPI() }
        register { DevicePublicIPAPI() }
        register { (_, arg) -> TrendingMoviesAPI in
            let page = (arg as? Int ?? 1)
            return TrendingMoviesAPI(page: page)
        }
        register { (_, arg) -> LocationCoordinatesAPI in
            let publicIP = arg as! String
            return LocationCoordinatesAPI(ip: publicIP)
        }
        register { (resolver, args) -> FiveDaysWeatherForcastAPI in
            let lat: Double? = resolver.firstArgument(from: args!)
            let longt: Double? = resolver.secondArgument(from: args!)
            return FiveDaysWeatherForcastAPI(lat: lat!, longt: longt!)
        }
    }
}
