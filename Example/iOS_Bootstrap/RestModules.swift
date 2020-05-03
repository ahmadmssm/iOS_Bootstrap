//
//  RestModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//
//  Ref: https://github.com/hmlongco/Resolver/blob/master/Documentation/Arguments.md

import RxSwift
import Resolver
import iOS_Bootstrap

extension Resolver {
    
    static func restModules() {
        restClientModules()
        restAPIsModules()
    }
    
    static func restClientModules() {
        register { SessionManager() as SessionService }
        register { AlamofireLoader() as LoadingIndicatorService }
        register { (AppRestClient(resolve(), resolve()) as RxAlamofireClientProtocol) }.scope(application)
    }
    
    static func restAPIsModules() {
        register { RefreshTokenAPI() }
        register { (resolver, args: Any) -> Single<MoviesPage> in
            // let page = args as! Int
            // let page: Int = resolver.argument(from: args, argumentNo: 0)!
            let page: Int = resolver.arg0(from: args)!
            return getRxAPI(api: TrendingMoviesAPI(page: page))
        }
        register { (_, _) -> Single<[Country]> in
            return getRxAPI(api: WorldCountriesAPI())
        }
        register { (_, _) -> Single<Data> in
            return getDataRxAPI(api: DevicePublicIPAPI())
        }
        register { (_, arg) -> Single<Coordinates> in
            let publicIP = arg as! String
            return getRxAPI(api: LocationCoordinatesAPI(ip: publicIP))
        }
        register { (resolver, args) -> Single<WeatherForcast> in
            let lat: Double? = resolver.arg0(from: args!)
            let longt: Double? = resolver.arg1(from: args!)
            return getRxAPI(api: FiveDaysWeatherForcastAPI(lat: lat!, longt: longt!))
        }
    }
}
