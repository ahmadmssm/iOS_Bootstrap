//
//  ForcastList.swift
//  Created on November 5, 2018

struct Forcast : Decodable {
    
    let timeStamp : Int?
    let date : String?
    let main : Main?
    let wind : Wind?
    
    enum CodingKeys: String, CodingKey {
        case timeStamp = "dt"
        case date = "dt_txt"
        case main = "main"
        case wind = "wind"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timeStamp = try values.decodeIfPresent(Int.self, forKey: .timeStamp)
        date = try values.decodeIfPresent(String.self, forKey: .date)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
    }
    
}
