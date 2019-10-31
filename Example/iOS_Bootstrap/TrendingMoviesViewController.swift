//
//  TrendingMoviesViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class TrendingMoviesViewController:
                    MyMenuItemViewController<TrendingMoviesPresenter, TrendingMoviesViewDelegate>,
                    TrendingMoviesViewDelegate,
                    TrendingMoviesAdapterProtocol {
    
    @IBOutlet private weak var tableView: UITableView!
    private var tableViewAdapter: TrendingMoviesAdapter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableViewAdapter = TrendingMoviesAdapter(tableView: tableView,
                                                 trendingMoviesAdapterProtocol: self)
    }
    
    override func initUI() {
        self.title = "Trending movies"
        createFloatingButton()
    }
    
    override func localizeStrings() {}

    //
    func rowDidSelected(indexPath: IndexPath) {
        getPresenter().getSummaryForMovieAt(index: indexPath.row)
    }
    
    func loadMore(forPage page: Int, updatedDataSource: [TrendingMovieCellModel]) {
         getPresenter().getTrendingMovies(pageNumber: page)
    }
    
    //
    func setPaginationParams(totalNumberOfItems: Int, itemsPerPage: Int) {
        tableViewAdapter.configurePaginationParameters(totalNumberOfItems: totalNumberOfItems,
                                                       itemsPerPage: itemsPerPage)
    }
    
    func didGet(trendingMovies: [TrendingMovieCellModel]) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.tableViewAdapter.reloadTable(pageItems: trendingMovies)
        }
    }
    
    func didFailToGetTrendingMovies(error: String) {
        showError(errorMessage: error)
    }
    
    func didGetMovieSummary(summary: String) {
        showInfo(message: summary)
    }
    
    @objc func buttonClick(_ :UIButton) {
        performBackAction()
    }
}
