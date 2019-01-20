//
//  APIs + testing.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 1/20/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

extension APIs {
    var sampleData: Data {
        switch self {
        case .getWorldCountries():
            return TestingHelpers.getDataFromJsonFileWith(name: "Countries")!
        default: return Data()
        }
    }
}
