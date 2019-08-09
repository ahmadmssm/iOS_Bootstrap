//
//  City.swift
//  Created on November 5, 2018

struct City : Decodable {
    
    let coordinates : Coordinates?
    let country : String?
    let id : Int?
    let name : String?
    
    enum CodingKeys: String, CodingKey {
        case coord
        case country
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        coordinates = try values.decodeIfPresent(Coordinates.self, forKey: .coord)
        country = try values.decodeIfPresent(String.self, forKey: .country)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
    }
}
