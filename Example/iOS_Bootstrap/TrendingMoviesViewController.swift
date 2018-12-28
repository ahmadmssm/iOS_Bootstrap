//
//  TrendingMoviesViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import SCLAlertView

class TrendingMoviesViewController:
    MyMenuItemLiveTableViewController
                <TrendingMoviesPresenter, TrendingMoviesViewDelegator, TrendingMovieCellModel>,
    BaseTableViewDelegates {
    
    @IBOutlet private weak var tableView: UITableView!
    //
    private var sclAlertViewAppearance : SCLAlertView.SCLAppearance!
    private var sclAlertView : SCLAlertView!
    private var floatingButton : UIButton!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        self.title = "Trending movies"
        sclAlertViewAppearance =  SCLAlertView.SCLAppearance(
            showCloseButton: false,
            hideWhenBackgroundViewIsTapped: true
        )
        createFloatingButton()
    }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: TrendingMoviesCell.self, delegate: self)
    }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TrendingMoviesCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        let cellModel = self.getTableViewDataSource[indexPath.row]
        cell.cellMode = cellModel
        return cell
    }
    
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
        getPresenter().getSummaryForMovieAt(index: indexPath.row)
    }
    
    func loadMore(tableView: UITableView, forPage page: Int, updatedDataSource: [Any]) {
        getPresenter().getTrendingMovies(pageNumber: page)
    }
    
    @objc func buttonClick(_ sender: UIButton) { performBackAction() }
    
}

extension TrendingMoviesViewController: TrendingMoviesViewDelegator {
    
    func didGetMovieSummary(summary: String) {
        sclAlertView = SCLAlertView(appearance: sclAlertViewAppearance)
        sclAlertView.showEdit("Movie summary", subTitle: summary)
    }
    
    func didFailToGetTrendingMovies(error: String) {
        SCLAlertView().showError("Error", subTitle: error)
    }
    
}

extension TrendingMoviesViewController {
    
    // Floating button
    private func createFloatingButton() {
        floatingButton = UIButton()
        floatingButton = UIButton(type: .custom)
        floatingButton.translatesAutoresizingMaskIntoConstraints = false
        floatingButton.backgroundColor = .white
        floatingButton.setImage(#imageLiteral(resourceName: "back"), for: .normal)
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
    
}
