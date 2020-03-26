//
//  TrendingMovieCellModel.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct TrendingMovieCellModel: Decodable, Equatable {
    
    private let baseImgURL = "https://image.tmdb.org/t/p/w92"
    private var posterURL: String?
    //
    var movieTitle: String?
    var overview: String?
    var releaseDate: String?
    var voting: Double?
    var originalLanguage: String?
    var imageURL: String? {
        set(url) { posterURL = baseImgURL + url! }
        get { return self.posterURL }
    }
}
