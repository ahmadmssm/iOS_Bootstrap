//
//  API_Configuration.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

enum API {
    
    case getWorldCountries()
    case getCountryDetailsByCountryName(countryName : String)
    
}

extension API : CustomTargetType {
    
    // override default url building behavior
    var baseURL: URL {
        return URL(string: "https://restcountries.eu/rest/v2")!
    }
    
    // method + path
    var route: Route {
        switch self {
        case .getWorldCountries():
            return .get("/all")
        case .getCountryDetailsByCountryName(let countryName):
            return .get("/name/\(countryName)")
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
        }
    }
    
    var sampleData: Data { return Data() }
    
}
