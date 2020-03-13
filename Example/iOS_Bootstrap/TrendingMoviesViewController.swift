//
//  TrendingMoviesViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesViewController:
                    AppViewController<TrendingMoviesPresenter, TrendingMoviesViewDelegate>,
                    TrendingMoviesViewDelegate,
                    TrendingMoviesAdapterProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewAdapter: TrendingMoviesAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAdapter = TrendingMoviesAdapter(tableView: tableView,
                                                 trendingMoviesAdapterProtocol: self)
    }
     
    override func initPresenter() -> TrendingMoviesPresenter {
        return  resolver.resolve(args: self)
    }
    
    override func localizeStrings() {
        self.title = "trending_movies".localized()
    }

    func didSelectRow(indexPath: IndexPath) {
        getPresenter().getSummaryForMovieAt(index: indexPath.row)
    }
    
    func loadMore(forPage page: Int, updatedDataSource: [TrendingMovieCellModel]) {
         getPresenter().getTrendingMovies()
    }
    
    func setPaginationParams(totalNumberOfItems: Int, itemsPerPage: Int) {
        tableViewAdapter.configurePaginationParameters(totalNumberOfItems: totalNumberOfItems,
                                                       itemsPerPage: itemsPerPage)
    }
    
    func didGet(trendingMovies: [TrendingMovieCellModel]) {
        self.tableViewAdapter.reloadTable(pageItems: trendingMovies)
    }
    
    func didGetMovieSummary(summary: String) {
        showInfo(message: summary)
    }
}
