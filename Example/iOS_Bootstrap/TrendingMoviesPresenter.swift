//
//  TrendingMoviesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesPresenter : BasePresenter<TrendingMoviesViewDelegator> {
   
    private var isListLoadingForTheFirstTime : Bool = true
    
    required init(viewDelegator: TrendingMoviesViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    override func viewControllerDidLoaded() { getTrendingMovies(pageNumber: 1) }
    
    func getTrendingMovies(pageNumber : Int) {
        getViewDelegator().loadingDidStarted?()
        APIsConnector.sharedInstance.getTrendingMovies(pageNo: pageNumber) { response in
            self.getViewDelegator().didFinishedLoading?()
            switch response {
            case .success(let moviesPage):
                if (self.isListLoadingForTheFirstTime) {
                    self.isListLoadingForTheFirstTime = false
                    self.getViewDelegator().didGetTrendingMoviesPage(page: moviesPage)
                }
                else {
                    self.getViewDelegator().didGetTrendingMoviesList(moviesList: moviesPage.moviesList!)
                }
                break
            case .failure(let errorMsg):
                self.getViewDelegator().didFailToGetTrendingMovies(error: errorMsg)
                break
            }
        }
    }
}
