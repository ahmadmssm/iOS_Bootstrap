//
//  CountriesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CountriesPresenter : BasePresenter<CountriesViewDelegator> {
    
    private var countriesArray : [Country]!
    private var filteredCountriesArray : [Country]!
    private var isFirstTimeLoading : Bool = true

    required init(viewDelegator: CountriesViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        //
        countriesArray = []
        filteredCountriesArray = []
    }
    
    override func viewControllerDidLoaded() { getWorldCountries() }
    
    func getWorldCountries() {
        APIsConnector.sharedInstance.getAllCountries (completion: { response in
            switch response {
            case .success(let countries):
                self.countriesArray.removeAll()
                self.countriesArray = countries
                self.getViewDelegator().didGetCountries(countries: countries)
                break
            case .failure(let errorMsg):
                self.getViewDelegator().didFailToGetCountries(error: errorMsg)
                print("Error : " + errorMsg)
                break
                    }
                })
    }
    
    func findCountriesWithText(text : String, currentDataSource : [Country]) {
        if (!isFirstTimeLoading) {
            if (text == "") {
                if (currentDataSource != countriesArray) {
                    getViewDelegator().loadingDidStarted!()
                    getViewDelegator().didResetCountriesTable(countries: countriesArray)
                }
                getViewDelegator().didFinishedLoading!()
            }
            else {
                getViewDelegator().loadingDidStarted!()
                filteredCountriesArray.removeAll()
                for country in countriesArray {
                    if (country.countryName?.range(of:text) != nil) {
                        filteredCountriesArray.append(country)
                    }
                }
                getViewDelegator().didGetSearchResults(filteredCountries: filteredCountriesArray)
                getViewDelegator().didFinishedLoading!()
            }
        }
        isFirstTimeLoading = false
    }
    
}
