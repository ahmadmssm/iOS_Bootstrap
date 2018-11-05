//
//  Country.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

struct Country : Decodable {
    
    var countryName : String?
    var capital : String?
    var region : String?
    var timeZones : [String]?
    var flag : String?
    var alpha3Code : String?
    var population : Double?
    var coordinates : [Double]?
    var area : Double?
    var numericCode : String?
    var currencies : [Currency]?

    enum CodingKeys: String, CodingKey {
        case countryName = "name"
        case capital = "capital"
        case region = "region"
        case timeZones = "timezones"
        case flag = "flag"
        case alpha3Code = "alpha3Code"
        case population = "population"
        case coordinates = "latlng"
        case area = "area"
        case numericCode = "numericCode"
        case currencies = "currencies"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        countryName = try values.decodeIfPresent(String.self, forKey: .countryName)
        capital = try values.decodeIfPresent(String.self, forKey: .capital)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        timeZones = try values.decodeIfPresent([String].self, forKey: .timeZones)
        flag = try values.decodeIfPresent(String.self, forKey: .flag)
        alpha3Code = try values.decodeIfPresent(String.self, forKey: .alpha3Code)
        population = try values.decodeIfPresent(Double.self, forKey: .population)
        coordinates = try values.decodeIfPresent([Double].self, forKey: .coordinates)
        area = try values.decodeIfPresent(Double.self, forKey: .area)
        numericCode = try values.decodeIfPresent(String.self, forKey: .numericCode)
        currencies = try values.decodeIfPresent([Currency].self, forKey: .currencies)
    }
    
}

