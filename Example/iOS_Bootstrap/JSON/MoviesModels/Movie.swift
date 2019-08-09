//
//  Movie.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/31/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct Movie : Codable {
    
    var voteCount, id: Int?
    var video, adult: Bool
    var voteAverage, popularity: Double?
    var title, posterPath, originalLanguage, originalTitle, backdropPath, overview, releaseDate: String?
    var genreIDS: [Int]?
    
    enum CodingKeys: String, CodingKey {
        case voteCount
        case voteAverage
        case posterPath
        case originalLanguage
        case originalTitle
        case genreIds
        case backdropPath
        case releaseDate
        case id, video, title, popularity, adult, overview
    }
    
    func encode(to encoder: Encoder) throws {}
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        genreIDS = try values.decodeIfPresent([Int].self, forKey: .genreIds)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        posterPath = try values.decodeIfPresent(String.self, forKey: .posterPath)
        originalTitle = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        originalLanguage = try values.decodeIfPresent(String.self, forKey: .originalLanguage)
        overview = try values.decodeIfPresent(String.self, forKey: .overview)
        releaseDate = try values.decodeIfPresent(String.self, forKey: .releaseDate)
        backdropPath = try values.decodeIfPresent(String.self, forKey: .backdropPath)        
        video = (try values.decodeIfPresent(Bool.self, forKey: .video))!
        adult = (try values.decodeIfPresent(Bool.self, forKey: .adult))!
    }
    
}
