//
//  WorldCountriesAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class WorldCountriesAPI: AppAPI<[Country]> {
    
    override var baseURL: URL { return "https://restcountries.eu/rest/v2".toURL() }
    override var route: Route { return .get("/all") }
    
        // var sampleData: Data {
        //        switch self {
        //        case .getWorldCountries():
        //            return TestingHelpers.getDataFromJsonFileWith(name: "Countries")!
        //        default: return Data()
        //        }
        //    }
}
