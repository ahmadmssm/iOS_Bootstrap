//
//  CountriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import iOS_Bootstrap
import SVGKit
import SCLAlertView
import RxSwift
import RxCocoa

class CountriesViewController:
                        MyMenuItemTableViewController<CountriesPresenter,
                        CountriesViewDelegator, Country>,
                        CountriesViewDelegator,
                        BaseTableViewDelegates {
    
    @IBOutlet weak private var tableView: UITableView!
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        //
        self.title = "World countries"
        //
        if #available(iOS 11.0, *) {
            //
            let searchController = NoCancelButtonSearchController(searchResultsController: nil)
            // Customise search controller
            searchController.hidesNavigationBarDuringPresentation = false
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationController?.hidesBarsWhenKeyboardAppears = false
            // searchController.searchBar.setValue("Search", forKey: "cancelButtonText")
            // Search bar
            let searchBar = searchController.searchBar
            // This property is mandatory for the cncel button call back to work, otherwise it wont work.
            // Ref : https://stackoverflow.com/questions/48090329/search-bar-cancel-button-delegate-not-called
            self.definesPresentationContext = true
            // Customise search bar
            searchBar.tintColor = UIColor.white
            searchBar.barTintColor = UIColor.white
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 15
                    backgroundview.clipsToBounds = true
                }
            }
            //
            let gradient : CAGradientLayer = CAGradientLayer()
            gradient.frame = searchBar.bounds
            gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            if let gardientImage = UIImage.getGradientImageFrom(gradientLayer: gradient) {
                navigationController?.navigationBar.barTintColor = UIColor(patternImage: gardientImage)
            }
            // Add search controller to navigation controller
            navigationItem.searchController = searchController
            // Customise navigation bar
            navigationItem.hidesSearchBarWhenScrolling = false
            //
            searchBar
                .rx
                .text // Observable propert
                .orEmpty
                .debounce(1.5, scheduler: MainScheduler.instance)
                .subscribe(onNext: { [unowned self] searchText in
                    // Here we will be notified of every new value
                    self.getPresenter().findCountriesWithText(text: searchText, currentDataSource: self.getTableViewDataSource)
                })
                .disposed(by: disposeBag)
        }
    }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: CountriesCell.self, delegate: self)
        //
        getTableViewAdapter().reloadTable()
        Skeleton.addTo(self.tableView)
    }
    
    func configureNumberOfRowsForSection(tableView: UITableView, section: Int) -> Int {
        if (getTableViewDataSource.count > 0) {
            return getTableViewDataSource.count
        }
        return 4
    }
    
    func withExpandableCell() -> Bool { return true }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CountriesCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if (getTableViewDataSource.count > 0) {
            cell.labelCountryName.text = getTableViewDataSource[indexPath.row].countryName!
            cell.labelCapitalName.text = getTableViewDataSource[indexPath.row].capital
            cell.labelRegion.text = getTableViewDataSource[indexPath.row].region
            cell.labelTimeZone.text = getTableViewDataSource[indexPath.row].timeZones?[0]
            //
            let flagURL = URL(string: getTableViewDataSource[indexPath.row].flag!)
            let flagImage: SVGKImage = SVGKImage(contentsOf: flagURL)
            cell.imageViewFlag.image = flagImage.uiImage
        }
        return cell
    }
    
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {}
    
    func emptyDataSetShouldDisplay() -> Bool { return self.isEmptyDataSource }
    
    func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.blue,
            NSAttributedStringKey.strokeWidth : -2.0,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }

    func didGetCountries(countries: [Country]) {
        getTableViewAdapter().reloadTable(pageItems: countries)
        Skeleton.removeFrom(self.tableView)
        if (getTableViewDataSource.count == 0) {
            self.isEmptyDataSource = true
            getTableViewAdapter().reloadTable()
        }
    }
    
    func didFailToGetCountries(error: String) {
        SCLAlertView().showError("Error", subTitle: error)
    }
    
    func didGetSearchResults(filteredCountries: [Country]) {
        getTableViewAdapter().setDataSource(dataSource: [])
        getTableViewAdapter().setDataSource(dataSource: filteredCountries)
        getTableViewAdapter().reloadTable()
    }
    
    func didResetCountriesTable(countries: [Country]) {
        getTableViewAdapter().reloadTable(pageItems: countries)
    }
    
}
