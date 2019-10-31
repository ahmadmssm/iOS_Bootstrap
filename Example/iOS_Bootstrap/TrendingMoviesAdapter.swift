//
//  TrendingMoviesAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesAdapter: BaseTableViewAdapter<UITableView, TrendingMovieCellModel> {
    
    private var trendingMoviesAdapterProtocol: TrendingMoviesAdapterProtocol!
    
    convenience init(tableView: UITableView,
                     trendingMoviesAdapterProtocol: TrendingMoviesAdapterProtocol) {
        self.init(tableView: tableView, xibCell: TrendingMoviesCell.self)
        self.trendingMoviesAdapterProtocol = trendingMoviesAdapterProtocol
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initCell(cell: TrendingMoviesCell.self, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        trendingMoviesAdapterProtocol.rowDidSelected(indexPath: indexPath)
    }
    
    override func loadMore(tableView: UITableView,
                           forPage page: Int,
                           updatedDataSource: [TrendingMovieCellModel]) {
        trendingMoviesAdapterProtocol.loadMore(forPage: page, updatedDataSource: updatedDataSource)
    }
}
