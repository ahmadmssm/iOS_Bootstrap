//
//  WeatherForcast.swift
//  Created on November 5, 2018

import Foundation

struct WeatherForcast : Decodable {
    
    let city : City?
    let country : Int?
    let code : String?
    let weatherForcastList : [Forcast]?
    let message : Float?
    
    
    enum CodingKeys: String, CodingKey {
        case city = "city"
        case country = "cnt"
        case code = "cod"
        case weatherForcastList = "list"
        case message = "message"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        city = try values.decodeIfPresent(City.self, forKey: .city)
        country = try values.decodeIfPresent(Int.self, forKey: .country)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        weatherForcastList = try values.decodeIfPresent([Forcast].self, forKey: .weatherForcastList)
        message = try values.decodeIfPresent(Float.self, forKey: .message)
    }
    
}
