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
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case id, video, title, popularity, adult, overview
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        //
        voteCount = try values.decodeIfPresent(Int.self, forKey: .voteCount)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        voteAverage = try values.decodeIfPresent(Double.self, forKey: .voteAverage)
        popularity = try values.decodeIfPresent(Double.self, forKey: .popularity)
        genreIDS = try values.decodeIfPresent([Int].self, forKey: .genreIDS)
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
