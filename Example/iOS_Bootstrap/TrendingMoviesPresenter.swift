//
//  TrendingMoviesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class TrendingMoviesPresenter: BasePresenter<TrendingMoviesViewDelegate> {
    
    private var moviesArray: [TrendingMovieCellModel]  = []
    private var page: Int = 1
    private var trendingMoviesRepo: TrendingMoviesRepo!
    
    required convenience init(viewDelegator: TrendingMoviesViewDelegate, trendingMoviesRepo: TrendingMoviesRepo) {
        self.init(viewDelegator: viewDelegator)
        self.trendingMoviesRepo = trendingMoviesRepo
    }
    
    required init(viewDelegator: TrendingMoviesViewDelegate) {
        super.init(viewDelegator: viewDelegator)
    }
    
    override func viewControllerDidLoad() {
        getTrendingMovies(pageNumber: page)
    }
    
    func getTrendingMovies(pageNumber : Int) {
        trendingMoviesRepo
            .getTrendingMovies(page: pageNumber)
            .flatMap({ [weak self] moviesPage -> Single<MoviesPage> in
                // The page params are set one time only
                if(self?.page == 1) {
                    self?
                        .getViewDelegate()
                        .setPaginationParams(totalNumberOfItems: moviesPage.totalNumberOfItems!,
                                             itemsPerPage: moviesPage.itemsPerPage!)
                }
                return Single.just(moviesPage)
            })
            .subscribe(onSuccess: { [weak self] moviesPage in
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
                self?.moviesArray.append(contentsOf: movies)
                self?.getViewDelegate().didGet(trendingMovies: self?.moviesArray ?? [])
            }) { [weak self] error in
                self?
                    .getViewDelegate()
                    .didFailToGetTrendingMovies(error: error.localizedDescription)
        }
        .disposed(by: getDisposeBag())
    }
    
    func getSummaryForMovieAt(index: Int) {
        var summary: String
        if let moviewOverview = moviesArray[index].overview {
            summary = moviewOverview
        }
        else {
            summary = "Sorry, There is no summary for this movie!"
        }
        getViewDelegate().didGetMovieSummary(summary: summary)
    }
}
