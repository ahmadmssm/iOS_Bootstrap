//
//  Currency.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct Currency : Decodable {
    
    var name : String?
    var code : String?
    var symbol : String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case symbol = "symbol"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        code = try values.decodeIfPresent(String.self, forKey: .code)
        symbol = try values.decodeIfPresent(String.self, forKey: .symbol)
    }

}
