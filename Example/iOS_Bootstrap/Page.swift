//
//  Page.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// https://reqres.in/api/users?page=3

public struct Page : Codable {

    var page : Int?
    var per_page : Int?
    var total : Int?
    var total_pages : Int?
    var data : [User]?
    
//    enum CodingKeys: String, CodingKey {
//        case perPage = "per_page"
//        case totalPages = "total_pages"
//    }
//    
//    public func encode(to encoder: Encoder) throws {
//        
//    }
//    
//    public init(from decoder: Decoder) throws {
//        
//    }
    
}
