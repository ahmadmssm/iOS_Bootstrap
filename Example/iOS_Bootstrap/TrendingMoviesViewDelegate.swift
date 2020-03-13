//
//  TrendingMoviesViewDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol TrendingMoviesViewDelegate: AppViewDelegate {
    func setPaginationParams(totalNumberOfItems: Int, itemsPerPage: Int)
    func didGet(trendingMovies: [TrendingMovieCellModel])
    func didGetMovieSummary(summary: String)
}
