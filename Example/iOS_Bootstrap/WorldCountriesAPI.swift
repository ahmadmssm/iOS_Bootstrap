//
//  WorldCountriesAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class WorldCountriesAPI: AppAPI {
    var route: Route { return .get(Endpoints.worldCountries) }
}

// var sampleData: Data {
//        switch self {
//        case .getWorldCountries():
//            return TestingHelpers.getDataFromJsonFileWith(name: "Countries")!
//        default: return Data()
//        }
//    }
