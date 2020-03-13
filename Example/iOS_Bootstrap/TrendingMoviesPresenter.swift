//
//  TrendingMoviesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class TrendingMoviesPresenter: AppPresenter<TrendingMoviesViewDelegate> {
    
    private var trendingMoviesRepo: TrendingMoviesRepo!
    
    required convenience init(viewDelegate: TrendingMoviesViewDelegate,
                              trendingMoviesRepo: TrendingMoviesRepo) {
        self.init(viewDelegate: viewDelegate)
        self.trendingMoviesRepo = trendingMoviesRepo
    }
    
    override func viewControllerDidLoad() {
        getTrendingMovies()
    }
    
    func getTrendingMovies() {
        trendingMoviesRepo
            .getTrendingMovies()
            .subscribe(onSuccess: { [weak self] moviesList in
                self?.posMoviesList(moviesList: moviesList)
            }) { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
    
    func getSummaryForMovieAt(index: Int) {
        let summary = trendingMoviesRepo.getSummaryForMovieAt(index: index)
        getViewDelegate().didGetMovieSummary(summary: summary)
    }
    
    private func posMoviesList(moviesList: [TrendingMovieCellModel]) {
        // The page params are set one time only
        if(trendingMoviesRepo.isFirstTime) {
            trendingMoviesRepo.isFirstTime = false
            getViewDelegate()
                .setPaginationParams(totalNumberOfItems: trendingMoviesRepo.totalNumberOfItems,
                                     itemsPerPage: trendingMoviesRepo.itemsPerPage)
        }
        getViewDelegate().didGet(trendingMovies: moviesList)
    }
}
