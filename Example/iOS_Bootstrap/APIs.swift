//
//  API_Configuration.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

enum APIs {
    
    case getWorldCountries()
    case getCountryDetailsByCountryName(countryName : String)
    case getUsers(page : String)
    
}

extension APIs : GenericAPIs {
    
    // override default url building behavior
    var baseURL: URL {
        switch self {
        case .getWorldCountries(),
             .getCountryDetailsByCountryName( _):
            return URL(string: "https://restcountries.eu/rest/v2")!
        case .getUsers( _):
            return URL(string: "https://reqres.in/api/users")!
        }
    }
    
    // method + path
    var route: Route {
        switch self {
        case .getWorldCountries():
            return .get("/all")
        case .getCountryDetailsByCountryName(let countryName):
            return .get("/name/\(countryName)")
        case .getUsers( _):
            return .get("")
        }
    }
    
    var headers: [String: String]? {
        return nil
    }
   
    // Encoding + Parameters
    // Use `URLEncoding()` as default when not specified
    var parameters: Parameters? {
        switch self {
        case .getWorldCountries(),
             .getCountryDetailsByCountryName(_):
            return nil
        case .getUsers(let page):
            return URLEncoding() => ["page": page]
        }
    }
    
    var sampleData: Data { return Data() }
    
}
