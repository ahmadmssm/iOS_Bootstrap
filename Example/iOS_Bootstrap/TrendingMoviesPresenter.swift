//
//  TrendingMoviesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesPresenter :
             BaseLiveListingPresenter<TrendingMoviesViewDelegator, TrendingMovieCellModel> {
    
    private var moviesArray: [Movie]  = []
    
    required init(viewDelegator: TrendingMoviesViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    override func viewControllerDidLoaded() { getTrendingMovies(pageNumber: 1) }

    func getTrendingMovies(pageNumber : Int) {
        Repo
            .getTrendingMovies(page: pageNumber)
            .subscribe(onSuccess: { [weak self] moviesPage in
                // The page params are set one time only,
                // Pagination hadling is done by the boot strap
                self?
                    .setPaginationParams(totalNumberOfItems: moviesPage.totalNumberOfItems!, itemsPerPage: moviesPage.itemsPerPage!)
                var movies: [TrendingMovieCellModel] = []
                for movie in moviesPage.moviesList! {
                    var trendingMovie = TrendingMovieCellModel()
                    //
                    trendingMovie.movieTitle = movie.title
                    trendingMovie.releaseDate = movie.releaseDate
                    trendingMovie.voting = movie.voteAverage
                    trendingMovie.originalLanguage = movie.originalLanguage
                    if let posterURL = movie.posterPath {
                        trendingMovie.imageURL = posterURL
                    }
                    movies.append(trendingMovie)
                }
                self?.moviesArray += moviesPage.moviesList!
                self?.dataSource = movies
            }) { [weak self] error in
                self?
                    .getViewDelegator()
                    .didFailToGetTrendingMovies(error: error.localizedDescription)
            }
            .disposed(by: getDisposeBag())
    }
    
    func getSummaryForMovieAt(index: Int) {
        var summary: String
        if let moviewOverview = moviesArray[index].overview { summary = moviewOverview }
        else { summary = "Sorry, There is no summary for this movie!" }
        getViewDelegator().didGetMovieSummary(summary: summary)
    }
}
