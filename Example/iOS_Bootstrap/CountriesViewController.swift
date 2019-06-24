//
//  CountriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import iOS_Bootstrap
import SVGKit
import RxSwift
import RxCocoa

@available(iOS 11.0, *)
class CountriesViewController:
                       MyMenuItemTableViewControllerV2
                             <CountriesPresenter, CountriesViewDelegator,
                              CountryEntity, CountriesCell>, BaseTableViewDelegates {

    @IBOutlet weak private var tableView: UITableView!
    private var searchBar : UISearchBar!
    //
    private var disposeBag: DisposeBag!
    private var svgImageHelper: SVGimageHelper!

    init() {
        super.init(nibName: nil, bundle: nil)
        disposeBag = DisposeBag()
        svgImageHelper = SVGimageHelper()
    }
    
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    override func localizeStrings() {}
    
    deinit { disposeBag = nil }

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSearch(searchBar: searchBar)
    }

    override func initUI() {
        self.title = "World countries"
        // This property is mandatory for the cancel button call back to work, otherwise it wont work.
        // Ref : https://stackoverflow.com/questions/48090329/search-bar-cancel-button-delegate-not-called
        self.definesPresentationContext = true
        let searchController = setUpNavigationBarSearchController()
        setUpSearchBar(searchController: searchController)
        setUpNavigationBar(searchController: searchController)
    }

    override func initTableViewAdapterConfiguraton() {
        super.initTableViewAdapterConfiguraton(tableView: tableView, delegate: self)
        getTableViewAdapter().reloadTable()
        Skeleton.addTo(self.tableView)
    }

    func configureNumberOfRowsForSection(tableView: UITableView, section: Int) -> Int {
        if (getTableViewDataSource.count > 0) { return getTableViewDataSource.count }
        return 4
    }

    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CountriesCell = self.initCell(indexPath: indexPath)
        return cell
    }

    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {}

}

// UI releated functions
@available(iOS 11.0, *)
extension CountriesViewController {
    private func setUpNavigationBar (searchController: UISearchController) {
        if let gardientImage = UIImage.getGradientImageFrom(gradientLayer: getGradientLayerForView(view: searchBar)) {
            navigationController?.navigationBar.barTintColor = UIColor(patternImage: gardientImage)
        }
        // Add search controller to navigation controller
        navigationItem.searchController = searchController
        // Customise navigation bar
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setUpSearchBar(searchController: UISearchController) {
        // Search bar
        searchBar = searchController.searchBar
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
    }
    
    private func getGradientLayerForView(view: UIView) -> CAGradientLayer {
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        return gradient
    }
    
    private func setUpNavigationBarSearchController() -> UISearchController {
        let searchController = NoCancelButtonSearchController(searchResultsController: nil)
        // Customise search controller
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.hidesBarsWhenKeyboardAppears = false
        // searchController.searchBar.setValue("Search", forKey: "cancelButtonText")
        return searchController
    }
    
    private func setUpSearch(searchBar: UISearchBar) {
        searchBar.rx
            .text
            .orEmpty
            .debounce(1.5, scheduler: Schedulers.uiScheduler)
            // Only emits if the current value is different from the last one
            .distinctUntilChanged()
            .subscribe(onNext: { searchText in
                // Here we will be notified of every new value
                self.getPresenter().findCountriesWith(name: searchText, currentDataSource: self.getTableViewDataSource)
            })
            .disposed(by: disposeBag)
    }
}

// View delegator callbacks
@available(iOS 11.0, *)
extension CountriesViewController: CountriesViewDelegator {
    func didGetCountries(countries: [CountryEntity]) {
        getTableViewAdapter().reloadTable(pageItems: countries)
        Skeleton.removeFrom(self.tableView)
        if (getTableViewDataSource.count == 0) {
            getTableViewAdapter().reloadTable()
        }
    }

    func didFailToGetCountries(error: String) {
        showError(errorMessage: error)
    }

    func didFailToSaveCountriesInCoreData(error: String) {

    }

    func didGetSearchResults(filteredCountries: [CountryEntity]) {
        getTableViewAdapter().setDataSource(dataSource: [])
        getTableViewAdapter().setDataSource(dataSource: filteredCountries)
        getTableViewAdapter().reloadTable()
    }

    func didResetCountriesTable(countries: [CountryEntity]) {
        //        getTableViewAdapter().reloadTable(pageItems: countries)
        getTableViewAdapter().reloadSinglePageTable(items: countries)
    }
}


