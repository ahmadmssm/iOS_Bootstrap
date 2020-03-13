//
//  CountriesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift
import Resolver

@available(iOS 10.0, *)
class CountriesPresenter: AppPresenter<CountriesViewDelegate> {
    
    @LazyInjected private var countriesRepo: CountriesRepo
    
    override func viewControllerDidLoad() { getWorldCountries() }
    
    private func getWorldCountries() {
        countriesRepo
            .fetchItems()
            .applyThreadingConfig()
            .subscribe(onSuccess: { [weak self] countries in
                self?.postCountries(countries: countries)
            }, onError: { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            })
            .disposed(by: disposeBag)
    }
    
    func findCountriesWith(text : String) {
        getViewDelegate().showLoading()
        countriesRepo
            .findCountriesWith(text: text)
            .subscribe(onSuccess: { [weak self] countries in
                self?.postCountries(countries: countries)
            }) { [weak self] error in
                self?.postError(errorMessage: error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
    
    private func postCountries(countries: [CountryEntity]) {
        getViewDelegate().hideLoading()
        getViewDelegate().didGetCountries(countries: countries)
    }
}
