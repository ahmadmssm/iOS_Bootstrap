//
//  WeatherForcast.swift
//  Created on November 5, 2018

import Foundation

struct WeatherForcast: Decodable {
    
    let city: City?
    let country: Int?
    let code: String?
    let weatherForcastList: [Forcast]?
    let message: Float?
    
    
    enum CodingKeys: String, CodingKey {
        case city
        case cnt
        case cod
        case list
        case message
    }
        
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(City.self, forKey: .city)
        country = try values.decodeIfPresent(Int.self, forKey: .cnt)
        code = try values.decodeIfPresent(String.self, forKey: .cod)
        weatherForcastList = try values.decodeIfPresent([Forcast].self, forKey: .list)
        message = try values.decodeIfPresent(Float.self, forKey: .message)
    }
}
