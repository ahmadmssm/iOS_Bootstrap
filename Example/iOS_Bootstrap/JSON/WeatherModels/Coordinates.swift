//
//  Coordinates.swift
//  Created on November 5, 2018

struct Coordinates : Codable {
    
    var lat : Double?
    var lon : Double?
    
    enum CodingKeys: String, CodingKey {
        case longitude
        case latitude
    }
    
    init() {}

    func encode(to encoder: Encoder) throws {}
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        lat = try values.decodeIfPresent(Double.self, forKey: .latitude)
        lon = try values.decodeIfPresent(Double.self, forKey: .longitude)
    }
}
