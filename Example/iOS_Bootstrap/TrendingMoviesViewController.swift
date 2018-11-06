//
//  TrendingMoviesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import iOS_Bootstrap
import Kingfisher
import SCLAlertView

class TrendingMoviesViewController:
    MyMenuItemTableViewController<TrendingMoviesPresenter, TrendingMoviesViewDelegator, Movie>,
    TrendingMoviesViewDelegator,
    BaseTableViewDelegates {
    
    @IBOutlet weak var tableView: UITableView!
    //
    private var sclAlertViewAppearance : SCLAlertView.SCLAppearance!
    private var sclAlertView : SCLAlertView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPresenter().getTrendingMovies(pageNumber: 1)
    }
    
    override func initUI() {
        sclAlertViewAppearance =  SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        self.title = "Trending movies"
    }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: TrendingMoviesCell.self, delegate: self)
    }
    
    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TrendingMoviesCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.movieTitleLabel.text = getTableViewDataSource[indexPath.row].title!
        cell.releaseDateLabel.text = getTableViewDataSource[indexPath.row].releaseDate
        cell.votingLabel.text = getTableViewDataSource[indexPath.row].voteAverage!.toString(withDecimalPoints: 1) + "  \u{2B50}"
        cell.movieLanguage.text = getTableViewDataSource[indexPath.row].originalLanguage
        //
        if let imageURL = getTableViewDataSource[indexPath.row].posterPath {
            let baseImgURL = "https://image.tmdb.org/t/p/w92"
            let posterURL = URL(string: baseImgURL + imageURL)
            cell.posterImage.kf.setImage(with: posterURL)
        }
        //
        return cell
    }
    
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
        if let moviewOverview = getTableViewDataSource[indexPath.row].overview {
            sclAlertView = SCLAlertView(appearance: sclAlertViewAppearance)
            sclAlertView.showEdit("Movie summary", subTitle: moviewOverview)
        }
        else {
            self.view.makeToast("Sorry, There is no summary for this movie!", duration: 3.0, position: .center)
        }
    }
    
    func loadMore(tableView: UITableView, forPage page: Int, updatedDataSource: [Any]) {
        getPresenter().getTrendingMovies(pageNumber: page)
    }
    
    override func loadingDidStarted() { EZLoadingActivity.show("Loading..", disableUI: true) }
    
    override func didFinishedLoading() { EZLoadingActivity.hide(true, animated: true) }
    
    func didGetTrendingMoviesPage(page: MoviesPage) {
        // Configure pagination parameters
        getTableViewAdapter().configurePaginationParameters(totalNumberOfItems: page.totalNumberOfItems!, itemsPerPage: page.itemsPerPage!)
        // Reload table with new page items only (Not the whole data source)
        getTableViewAdapter().reloadTable(pageItems: page.moviesList!)
    }
    
    func didGetTrendingMoviesList(moviesList: [Movie]) {
        getTableViewAdapter().reloadTable(pageItems: moviesList)
    }
    
    func didFailToGetTrendingMovies(error: String) {}

}

