//
//  WeatherForcastingRepo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver
import iOS_Bootstrap

class WeatherForcastingRepo: Resolving {
    
    func getPublicIP() -> Single<Data> {
        let devicePublicAPI: Single<Data> = resolver.resolve()
        return devicePublicAPI
    }

    func getLocationCoordinatesFor(publicIP: String) -> Single<Coordinates> {
        let locationCoordinatesAPI: Single<Coordinates> = resolver.resolve(args: publicIP)
        return locationCoordinatesAPI
    }

    func get5DaysWeatherForcastBy(lat: Double, longt: Double) -> Single<WeatherForcast> {
        let weatherForcastAPI: Single<WeatherForcast> = resolver.resolve(arg0: lat, arg1: longt)
        return weatherForcastAPI
    }
    
    func getFiveDaysWeatherForcastWithNetworkProvidedLocation() -> Single<WeatherForcast> {
        return getPublicIP()
            .map({ data -> String in
                return String(data: data, encoding: .utf8)!
            })
            .flatMap({ publicIP -> Single<Coordinates> in
                return self.getLocationCoordinatesFor(publicIP: publicIP)
            })
            .flatMap({ coordinates in
                return self.get5DaysWeatherForcastBy(lat: coordinates.lat!, longt: coordinates.lon!)
            })
    }
}
