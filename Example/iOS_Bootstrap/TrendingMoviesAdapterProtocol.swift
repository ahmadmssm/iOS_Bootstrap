//
//  TrendingMoviesAdapterProtocol.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/20/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

protocol TrendingMoviesAdapterProtocol {
    func rowDidSelected(indexPath: IndexPath)
    func loadMore(forPage page: Int, updatedDataSource: [TrendingMovieCellModel])
}
