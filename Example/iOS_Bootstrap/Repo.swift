//
//  Repo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift

struct Repo {
    
    static func getTrendingMovies(page: Int) -> Single<MoviesPage> {
        return GetTrendingMovies(page: page).requestWithNoAuthentication()
    }
    
    static func getAllCountries() -> Single<[Country]> {
        return GetWorldCountriesAPI().requestWithNoAuthentication()
    }
   
    static func getPublicIP() -> Single<String> {
        return GetDevicePublicIP().requestWithNoAuthentication()
    }
    
    static func getLocationCoordinatesFor(publicIP: String) -> Single<Coordinates> {
        return GetLocationCoordinates(ip: publicIP).requestWithNoAuthentication()
    }

    static func get5DaysWeatherForcastBy(lat: Double, longt: Double) -> Single<WeatherForcast> {
        return GetFiveDaysWeatherForcast(lat: lat, longt: longt).requestWithNoAuthentication()
    }
    
    static func getFiveDaysWeatherForcastWithNetworkProvidedLocation() -> Single<WeatherForcast> {
        return getPublicIP()
            .flatMap({ publicIP in
                return getLocationCoordinatesFor(publicIP: publicIP)
            })
            .flatMap({ coordinates in
                return get5DaysWeatherForcastBy(lat: coordinates.lat!, longt: coordinates.lon!)
            })
    }
}
