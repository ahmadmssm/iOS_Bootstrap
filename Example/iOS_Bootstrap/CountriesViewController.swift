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
             AppViewController <CountriesPresenter, CountriesViewDelegate>, CountriesViewDelegate {

    @IBOutlet weak private var tableView: UITableView!
    private var searchBar : UISearchBar!
    private var countriesTableViewAdapter: CountriesTableViewAdapter!
            
    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableViewAdapter = CountriesTableViewAdapter(tableView: tableView)
        searchBar.setUpSearchBarListener(action: { [weak self] searchText in
            self?.getCountriesWith(text: searchText)
        }, disposeBag: getPresenter().disposeBag)
    }

    override func initUI() {
        searchBar = SearchBarUtils(navigationItem: navigationItem).searchBar
        // This property is mandatory for the cancel button call back to work, otherwise it wont work.
        // Ref : https://stackoverflow.com/questions/48090329/search-bar-cancel-button-delegate-not-called
        self.definesPresentationContext = true
        self.navigationController?.hidesBarsWhenKeyboardAppears = false
    }
    
    override func localizeStrings() {
        self.title = "world_countries".localized()
    }
    
    override func didGetError(errorMessage: String) {
           showError(errorMessage: errorMessage)
    }
    
    func didGetCountries(countries: [CountryEntity]) {
        countriesTableViewAdapter.postItems(items: countries)
    }
    
    private func getCountriesWith(text: String)  {
        getPresenter().findCountriesWith(text: text)
    }
}
