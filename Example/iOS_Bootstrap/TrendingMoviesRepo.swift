//
//  TrendingMoviesRepo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver

class TrendingMoviesRepo: Resolving {
    
    var isFirstTime = true
    private(set) var itemsPerPage: Int = 0
    private(set) var totalNumberOfItems: Int = 0
    private var page: Int = 1
    private var moviesArray: [TrendingMovieCellModel]  = []
    
    
    func getTrendingMovies() -> Single<[TrendingMovieCellModel]> {
       let trendingMoviesAPI: Single<MoviesPage> = resolver.resolve(args: page)
       return trendingMoviesAPI
            .map({ [weak self] moviesPage -> [TrendingMovieCellModel] in
                let moviesList = self?.getMoviesListFrom(moviesPage: moviesPage) ?? []
                self?.page += 1
                self?.moviesArray.append(contentsOf: moviesList)
                self?.itemsPerPage = moviesPage.itemsPerPage ?? 0
                self?.totalNumberOfItems = moviesPage.totalNumberOfItems ?? 0
                return moviesList
            })
    }
    
    func getSummaryForMovieAt(index: Int) -> String {
        var summary: String
        if let moviewOverview = moviesArray[index].overview {
            summary = moviewOverview
        }
        else {
            summary = "Sorry, There is no summary for this movie!"
        }
        return summary
    }
    
    func reset() {
        page = 1
        isFirstTime = true
        moviesArray = []
    }
    
    private func getMoviesListFrom(moviesPage: MoviesPage) -> [TrendingMovieCellModel] {
        var movies: [TrendingMovieCellModel] = []
        for movie in moviesPage.moviesList! {
            var trendingMovie = TrendingMovieCellModel()
            //
            trendingMovie.movieTitle = movie.title
            trendingMovie.releaseDate = movie.releaseDate
            trendingMovie.voting = movie.voteAverage
            trendingMovie.originalLanguage = movie.originalLanguage
            trendingMovie.overview = movie.overview
            if let posterURL = movie.posterPath {
                trendingMovie.imageURL = posterURL
            }
            movies.append(trendingMovie)
        }
        return movies
    }
}
