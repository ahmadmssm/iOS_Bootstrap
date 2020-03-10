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
             AppViewController <CountriesPresenter, CountriesViewDelegator>, CountriesViewDelegator {

    @IBOutlet weak private var tableView: UITableView!
    private var searchBar : UISearchBar!
    private var countriesTableViewAdapter: CountriesTableViewAdapter!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableViewAdapter = CountriesTableViewAdapter(tableView: tableView)
        configureSearchFor(searchBar: searchBar)
    }

    override func initUI() {
        // This property is mandatory for the cancel button call back to work, otherwise it wont work.
        // Ref : https://stackoverflow.com/questions/48090329/search-bar-cancel-button-delegate-not-called
        self.definesPresentationContext = true
        let searchController = getNavigationBarSearchController()
        configureSearchBarWith(searchController: searchController)
    }
    
    override func localizeStrings() {
        self.title = "world_countries".localized()
    }
    
    private func getNavigationBarSearchController() -> UISearchController {
        let searchController = NoCancelButtonSearchController(searchResultsController: nil)
        // Customize search controller
        searchController.hidesNavigationBarDuringPresentation = false
        // Add search controller to navigation controller
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.hidesBarsWhenKeyboardAppears = false
        // Override search bar cancel word
        // searchController.searchBar.setValue("", forKey: "cancelButtonText")
        return searchController
    }

    private func configureSearchBarWith(searchController: UISearchController) {
        // Search bar
        searchBar = searchController.searchBar
        // Customize search bar
        searchBar.tintColor = UIColor.white
        searchBar.barTintColor = UIColor.white
        let gradientLayer: CAGradientLayer = .getAppGradientLayerForView(view: searchBar)
        if let gardientImage = UIImage.getGradientImageFrom(gradientLayer: gradientLayer) {
            searchBar.backgroundColor = UIColor(patternImage: gardientImage)
        }
        if #available(iOS 13.0, *) {
            searchController.automaticallyShowsCancelButton = false
            searchBar.searchTextField.backgroundColor = UIColor.white
            // Rounded corner
            searchBar.searchTextField.layer.cornerRadius = 15
            searchBar.searchTextField.layer.masksToBounds = true
            //
            searchBar.searchTextField.textColor = UIColor.blue
            searchBar.searchTextField.tintColor = UIColor.blue
        }
        else {
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 15
                    backgroundview.clipsToBounds = true
                }
            }
        }
    }
        
    private func configureSearchFor(searchBar: UISearchBar) {
        searchBar.rx
            .text
            .orEmpty
            .debounce(1.5, scheduler: Schedulers.uiScheduler)
            // Only emits if the current value is different from the last one
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] searchText in
                // Here we will be notified of every new value
                self?.searchForCountryWith(text: searchText)
            })
            .disposed(by: getPresenter().disposeBag)
    }
    
    func didGetCountries(countries: [CountryEntity]) {
        countriesTableViewAdapter.reloadSinglePageTable(items: countries)
    }
    
    func didFailToGetCountries(error: String) {
        showError(errorMessage: error)
    }

    func didFailToSaveCountriesInCoreData(error: String) {
        showError(errorMessage: error)
    }

    func didGetSearchResults(filteredCountries: [CountryEntity]) {
        countriesTableViewAdapter.postSearchItems(searchItems: filteredCountries)
    }
    
    func didResetCountriesTable(countries: [CountryEntity]) {
        countriesTableViewAdapter.showAllDataSet(items: countries)
    }
    
    private func searchForCountryWith(text: String)  {
        let dataSource = countriesTableViewAdapter.dataSource
        getPresenter().findCountriesWith(name: text, currentDataSource: dataSource)
    }
}
