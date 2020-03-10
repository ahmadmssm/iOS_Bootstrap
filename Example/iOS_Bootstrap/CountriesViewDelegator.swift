//
//  CountriesViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol CountriesViewDelegator: BaseViewDelegate {
    func didGetCountries(countries : [CountryEntity])
    func didFailToGetCountries(error : String)
    func didFailToSaveCountriesInCoreData(error : String)
    func didGetSearchResults(filteredCountries : [CountryEntity])
    func didResetCountriesTable(countries : [CountryEntity])
}
