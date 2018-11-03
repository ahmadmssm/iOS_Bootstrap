//
//  MoviesPage.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MoviesPage : BasePage {
    
    var moviesList : [Movie]?
    var totalPages : Int?
    
    enum CodingKeys: String, CodingKey {
        case totalNumberOfItems = "total_results"
        case totalPages = "total_pages"
        case moviesList = "results"
    }
    
    required init() { super.init() }
    
    public required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //
        totalNumberOfItems = try values.decodeIfPresent(Int.self, forKey: .totalNumberOfItems)
        totalPages = try values.decodeIfPresent(Int.self, forKey: .totalPages)
        moviesList = try values.decodeIfPresent([Movie].self, forKey: .moviesList)
        //
        if (totalNumberOfItems! > 0 && totalPages! > 0) {
            self.itemsPerPage = totalNumberOfItems!/totalPages!
        }
    }
    
}

