//
//  ForcastList.swift
//  Created on November 5, 2018

struct Forcast : Decodable {
    
    let timeStamp : Int?
    let date : String?
    let main : Main?
    let wind : Wind?
    let additionalData : [AdditionalData]?
    
    enum CodingKeys: String, CodingKey {
        case dt
        case dtTxt
        case main
        case wind
        case weather
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        timeStamp = try values.decodeIfPresent(Int.self, forKey: .dt)
        date = try values.decodeIfPresent(String.self, forKey: .dtTxt)
        main = try values.decodeIfPresent(Main.self, forKey: .main)
        wind = try values.decodeIfPresent(Wind.self, forKey: .wind)
        additionalData = try values.decodeIfPresent([AdditionalData].self, forKey: .weather)
    }
}
