//
//  Wind.swift
//  Model Generated using http://www.jsoncafe.com/ 
//  Created on November 5, 2018

import Foundation

struct Wind: Codable, Equatable {
    
    let deg: Float?
    let speed: Float?
    
    enum CodingKeys: String, CodingKey {
        case deg
        case speed
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        deg = try values.decodeIfPresent(Float.self, forKey: .deg)
        speed = try values.decodeIfPresent(Float.self, forKey: .speed)
    }
}
