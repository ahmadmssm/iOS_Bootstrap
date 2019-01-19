//
//  API_Configuration.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

enum APIs {
    case refreshToken(token: String)
    case getWorldCountries()
    case getTrendingMovies(page : Int)
    case getDevicePublicIP()
    case getLocationCoordinates(publicIP : String)
    case getFiveDaysWeatherForcast(lat : Double, longt : Double)
}

extension APIs : GenericAPIs {
    
    // override default url building behavior
    var baseURL: URL {
        switch self {
        case .getWorldCountries():
            return URL(string: Environment.getEnvironmentVariables().baseURL)!
        case .getTrendingMovies( _):
            return URL(string: "https://api.themoviedb.org/3/")!
        case .getDevicePublicIP():
            return URL(string: "https://api.ipify.org?format=json")!
        case .getLocationCoordinates( _):
            return URL(string: "http://api.ipstack.com")!
        case .getFiveDaysWeatherForcast( _, _):
            return URL(string: "http://api.openweathermap.org/data/2.5")!
        default:
            return URL(string: "https://restcountries.eu/rest/v2")!
        }
    }
    
    // method + path
    var route: Route {
        switch self {
        case .getWorldCountries():
            return .get("/all")
        case .refreshToken( _):
            return .post("")
        case .getTrendingMovies( _):
            return .get("movie/popular")
        case .getDevicePublicIP:
            return .get("")
        case .getLocationCoordinates(let publicIP):
            return .get("/" + publicIP)
        case .getFiveDaysWeatherForcast( _, _):
            return .get("/forecast")

        }
    }
    
    var headers: [String: String]? { return nil }
   
    // Encoding + Parameters
    // Use `URLEncoding()` as default when not specified
    var parameters: Parameters? {
        switch self {
        case .getWorldCountries():
            return nil
        case .refreshToken( _):
            return nil
        case .getTrendingMovies(let page):
            return URLEncoding() => [
                "api_key" : Constants.tmdbAuthKey,
                "page": page
            ]
        case .getDevicePublicIP:
            return nil
        case .getLocationCoordinates( _):
            return URLEncoding() => ["access_key" : Constants.ipstackAuthKey]
        case .getFiveDaysWeatherForcast(let lat, let longt):
            return URLEncoding() => [
                "lat" : lat,
                "lon" : longt,
                "units" : "metric",
                "APPID" : Constants.openApiAuthKey
            ]
        }
    }
    
    var sampleData: Data {
        return Data() }
    
}
