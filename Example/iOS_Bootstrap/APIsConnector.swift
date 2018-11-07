
//
//  APIsConnector.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7var.
//  Copyright © 2018varmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class APIsConnector : BaseAPIsConnector<APIs> {
    
    static let sharedInstance: APIsConnector = APIsConnector()
    
    override private init() { super.init() }

    override func enableNetworkPlugins() -> Bool { return true }

    override func configureNetworkPlugginsIfNeeded() -> [PluginType] {
        var plugins : [PluginType] = []
        let networkLogger = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        plugins.append(networkLogger)
        return plugins
    }

    override func configureErrorHandle() {
        GenericErrorConfigurator.defaultErrorHandler(HumanReadableErrorHandler())
    }

    // Write your network calls here
    override func getTokenRefreshService() -> Single<Response> {
        return apisProvider.rx.request(.getWorldCountries())
    }
    
    func getAllCountries (completion: @escaping completionHandler<[Country]>) {
        subscriber = apisProvider.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
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
        return apisProvider.rx
                .request(.getDevicePublicIP())
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
                .mapString()
                .map { response in
                    let publicIP : String =  response.toDictionary()["ip"] as! String
                    return publicIP
        }
    }

    private func getLocationCoordinates(publicIP : String) -> Single<Coordinates> {
        return apisProvider
            .rx
            .request(.getLocationCoordinates(publicIP: publicIP))
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
            .mapString()
            .map { response in
                let locationDetails = response.toDictionary()
                let latitude : Double = locationDetails["latitude"] as! Double
                let longitude : Double = locationDetails["longitude"] as! Double
                var locationObject : Coordinates = Coordinates()
                locationObject.lat = latitude
                locationObject.lon = longitude
                return locationObject
        }
    }

    func getFiveDaysWeatherForcastWithNetworkProvidedLocation(completion: @escaping completionHandler<WeatherForcast>) {
        subscriber = getPublicIP()
            .flatMap() { publicIP in self.getLocationCoordinates(publicIP: publicIP) }
            .flatMap() { location in                self.apisProvider.rx.request(.getFiveDaysWeatherForcast (lat: location.lat!, longt: location.lon!))
            }
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
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
        subscriber = apisProvider.rx
            .request(.getFiveDaysWeatherForcast(lat: lat, longt: longt))
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
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

    func getTrendingMovies (pageNo : Int, completion: @escaping completionHandler<MoviesPage>) {
        subscriber = apisProvider.rx
            .request(.getTrendingMovies(page: pageNo))
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
            .map(MoviesPage.self)
            .subscribe { event in
                switch event {
                case .success(let moviesPage):
                     completion(.success(moviesPage))
                case .error(let error):
                    print("Error string " + error.localizedDescription)
                    completion(.failure(error.localizedDescription))
                }
        }
    }

}
