//
//  TrendingMoviesViewDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol TrendingMoviesViewDelegate: BaseViewDelegator {
    func setPaginationParams(totalNumberOfItems: Int, itemsPerPage: Int)
    func didGet(trendingMovies: [TrendingMovieCellModel])
    func didFailToGetTrendingMovies(error: String)
    func didGetMovieSummary(summary: String)
}
