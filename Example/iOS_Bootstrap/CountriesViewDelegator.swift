//
//  CountriesViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol CountriesViewDelegator : BaseViewDelegator {
    func didGetCountries(countries : [Country])
    func didFailToGetCountries(error : String)
    func didGetSearchResults(filteredCountries : [Country])
    func didResetCountriesTable(countries : [Country])
}
