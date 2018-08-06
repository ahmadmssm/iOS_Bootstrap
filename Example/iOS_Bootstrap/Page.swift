//
//  Page.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// https://reqres.in/api/users?page=3
// Ref : https://developer.apple.com/documentation/foundation/archives_and_serialization/encoding_and_decoding_custom_types
//

public struct Page : Codable {

    var page : Int?
    var perPage : Int?
    var total : Int?
    var totalPages : Int?
    var users : [User]?
   
    enum CodingKeys: String, CodingKey {
        case perPage = "per_page"
        case totalPages = "total_pages"
        case page
        case total
        case users = "data"
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        //
        try container.encode(perPage, forKey: .perPage)
        try container.encode(page, forKey: .page)
        try container.encode(total, forKey: .total)
        try container.encode(totalPages, forKey: .totalPages)
        try container.encode(users, forKey: .users)
    }
    
    //
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //
        perPage = try values.decodeIfPresent(Int.self, forKey: .perPage)
        page = try values.decodeIfPresent(Int.self, forKey: .page)
        total = try values.decodeIfPresent(Int.self, forKey: .total)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        users = try values.decodeIfPresent([User].self, forKey: .users)  
    }
    
}
