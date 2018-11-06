//
//  Main.swift
//  Created on November 5, 2018

import Foundation

struct Main : Codable {
    
    let grndLevel : Float?
    let humidity : Float?
    let pressure : Float?
    let seaLevel : Float?
    let temp : Float?
    let tempKf : Float?
    let tempMax : Float?
    let tempMin : Float?
    
    enum CodingKeys: String, CodingKey {
        case grndLevel = "grnd_level"
        case humidity = "humidity"
        case pressure = "pressure"
        case seaLevel = "sea_level"
        case temp = "temp"
        case tempKf = "temp_kf"
        case tempMax = "temp_max"
        case tempMin = "temp_min"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        grndLevel = try values.decodeIfPresent(Float.self, forKey: .grndLevel)
        humidity = try values.decodeIfPresent(Float.self, forKey: .humidity)
        pressure = try values.decodeIfPresent(Float.self, forKey: .pressure)
        seaLevel = try values.decodeIfPresent(Float.self, forKey: .seaLevel)
        temp = try values.decodeIfPresent(Float.self, forKey: .temp)
        tempKf = try values.decodeIfPresent(Float.self, forKey: .tempKf)
        tempMax = try values.decodeIfPresent(Float.self, forKey: .tempMax)
        tempMin = try values.decodeIfPresent(Float.self, forKey: .tempMin)
    }
    
}
