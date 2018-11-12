//
//  TrendingMoviesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

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
    private var floatingButton : UIButton!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        sclAlertViewAppearance =  SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        self.title = "Trending movies"
        //
        floatingButton = UIButton()
        createFloatingButton()
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
    
    func didFailToGetTrendingMovies(error: String) {
        SCLAlertView().showError("Error", subTitle: error)
    }

    private func createFloatingButton() {
        floatingButton = UIButton(type: .custom)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.backgroundColor = .white
        floatingButton.setImage(#imageLiteral(resourceName: "bill"), for: .normal)
        floatingButton.addTarget(self, action: #selector(buttonClick(_:)), for: UIControlEvents.touchUpInside)
        // We're manipulating the UI, must be on the main thread:
        DispatchQueue.main.async {
            if let keyWindow = UIApplication.shared.keyWindow {
                keyWindow.addSubview(self.floatingButton)
                NSLayoutConstraint.activate([
                    keyWindow.trailingAnchor.constraint(equalTo: self.floatingButton.trailingAnchor, constant: 15),
                    keyWindow.bottomAnchor.constraint(equalTo: self.floatingButton.bottomAnchor, constant: 15),
                    self.floatingButton.widthAnchor.constraint(equalToConstant: 75),
                    self.floatingButton.heightAnchor.constraint(equalToConstant: 75)])
            }
            // Make the button round:
            self.floatingButton.layer.cornerRadius = 37.5
            self.floatingButton.layer.backgroundColor = StaticResources.CustomColors.beautifulBlueColor.cgColor
            // Add a black shadow:
            self.floatingButton.layer.shadowColor = UIColor.black.cgColor
            self.floatingButton.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
            self.floatingButton.layer.masksToBounds = false
            self.floatingButton.layer.shadowRadius = 2.0
            self.floatingButton.layer.shadowOpacity = 0.5
            // Add a pulsing animation to draw attention to button:
            let scaleAnimation: CABasicAnimation = CABasicAnimation(keyPath: "transform.scale")
            scaleAnimation.duration = 0.4
            scaleAnimation.repeatCount = .greatestFiniteMagnitude
            scaleAnimation.autoreverses = true
            scaleAnimation.fromValue = 1.0;
            scaleAnimation.toValue = 1.05;
            self.floatingButton.layer.add(scaleAnimation, forKey: "scale")
        }
    }
    
    @objc func buttonClick(_ sender: UIButton) {
        performBackAction()
    }
    
}
