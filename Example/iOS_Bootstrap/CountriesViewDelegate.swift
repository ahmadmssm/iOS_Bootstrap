//
//  CountriesViewDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

protocol CountriesViewDelegate: AppViewDelegate {
    func didGetCountries(countries : [CountryEntity])
}
