//
//  APIsConnector + requests.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

extension APIsConnector {
    
    // Write network calls here
    
    func getAllCountries (completion: @escaping completionHandler<[Country]>) {
        networkRequest = request(api: .getWorldCountries())
            .map([Country].self)
            .subscribe { event in
                switch event {
                case .success(let countries):
                    completion(.success(countries))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
    private func getPublicIP () -> Single<String> {
        return request(api: .getDevicePublicIP()).mapString().map { response in
            return response.toDictionary()["ip"] as! String
        }
    }
    
    private func getLocationCoordinates(publicIP : String) -> Single<Coordinates> {
        return request(api: .getLocationCoordinates(publicIP: publicIP))
            .mapString()
            .map { response in
                    let locationDetails = response.toDictionary()
                    let latitude: Double = locationDetails["latitude"] as! Double
                    let longitude: Double = locationDetails["longitude"] as! Double
                    var locationObject : Coordinates = Coordinates()
                    locationObject.lat = latitude
                    locationObject.lon = longitude
                    return locationObject
        }
    }
    
    func getFiveDaysWeatherForcastWithNetworkProvidedLocation(
        completion: @escaping completionHandler<WeatherForcast>) {
        networkRequest = getPublicIP()
            .flatMap() { publicIP in self.getLocationCoordinates(publicIP: publicIP) }
            .flatMap() { location in
                self.flatRequest(api: .getFiveDaysWeatherForcast (lat: location.lat!, longt: location.lon!))
            }
            .applyFilterStatusCodeAndProcessErrorsAndTokenRefresh(tokenRefreshDelegate: self)
            .map(WeatherForcast.self)
            .subscribe { event in
                switch event {
                case .success(let weatherForcast):
                    completion(.success(weatherForcast))
                    break
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
    func getFiveDaysWeatherForcastWithGPSprovidedLocation(lat : Double, longt : Double, completion: @escaping completionHandler<WeatherForcast>) {
        networkRequest = request(api: .getFiveDaysWeatherForcast(lat: lat, longt: longt))
            .map(WeatherForcast.self)
            .subscribe { event in
                switch event {
                case .success(let weatherForcast):
                    completion(.success(weatherForcast))
                    break
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
    func getTrendingMovies (pageNo : Int,
                            completion: @escaping completionHandler<MoviesPage>) {
        networkRequest = request(api: .getTrendingMovies(page: pageNo))
            .map(MoviesPage.self)
            .subscribe { event in
                switch event {
                case .success(let moviesPage):
                    completion(.success(moviesPage))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
}

