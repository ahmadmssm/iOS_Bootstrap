//
//  Repo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver
import iOS_Bootstrap

class Repo: Resolving {
    
    @LazyInjected private var worldCountriesAPI: WorldCountriesAPI
    @LazyInjected private var devicePublicIPAPI: DevicePublicIPAPI
    
    func getAllCountries() -> Single<[Country]> {
        return worldCountriesAPI
            .requestWithNoAuthentication()
            // Dealy just to show the skeleton effect :D
            .delaySubscription(2.0, scheduler: Schedulers.backgroundConcurrentScheduler)
    }
   
    func getPublicIP() -> Single<String> {
        return devicePublicIPAPI.requestWithNoAuthentication()
    }
    
    func getLocationCoordinatesFor(publicIP: String) -> Single<Coordinates> {
        let locationCoordinatesAPI: LocationCoordinatesAPI = resolver.resolve(args: publicIP)
        return locationCoordinatesAPI.requestWithNoAuthentication()
    }

    func get5DaysWeatherForcastBy(lat: Double, longt: Double) -> Single<WeatherForcast> {
        let fiveDaysWeatherForcastAPI: FiveDaysWeatherForcastAPI = resolver.resolve(arg0: lat, arg1: longt)
        return fiveDaysWeatherForcastAPI.requestWithNoAuthentication()
    }
    
    func getFiveDaysWeatherForcastWithNetworkProvidedLocation() -> Single<WeatherForcast> {
        return getPublicIP()
            .flatMap({ publicIP in
                return self.getLocationCoordinatesFor(publicIP: publicIP)
            })
            .flatMap({ coordinates in
                return self.get5DaysWeatherForcastBy(lat: coordinates.lat!, longt: coordinates.lon!)
            })
    }
}
