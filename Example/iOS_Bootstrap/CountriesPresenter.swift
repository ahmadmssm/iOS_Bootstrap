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
class CountriesPresenter: BasePresenter<CountriesViewDelegator> {
    
    @LazyInjected private var repo: Repo
    @LazyInjected private var countriesCachingManager: CountriesCachingManager
    private var countriesArray : [CountryEntity]!
    private var filteredCountriesArray : [CountryEntity]!
    private var isFirstTimeLoading : Bool = true

    required init(viewDelegate: CountriesViewDelegator) {
        super.init(viewDelegate: viewDelegate)
        countriesArray = []
        filteredCountriesArray = []
    }
    
    override func viewControllerDidLoad() { getWorldCountries() }
    
    private func getWorldCountries() {
        repo
            .getAllCountries()
            .subscribe(onSuccess: { [weak self] countries in
                self?
                    .processCountriesList(countries: countries)
            }) { [weak self] error in
                self?
                    .getViewDelegate()
                    .didFailToGetCountries(error: error.localizedDescription)
                print("Error : " + error.localizedDescription)
        }
        .disposed(by: disposeBag)
    }
    
    private func processCountriesList(countries: [Country]) {
        // Flush search array
        self.countriesArray.removeAll()
        // Flush previously saved countries
        _ = countriesCachingManager
            .deleteAllRecords()
            .andThen(insertCountriesToCoreData(countries: countries))
            .andThen(countriesCachingManager.fetchAll())
            .asObservable()
            .subscribeOn(Schedulers.backgroundConcurrentScheduler)
            .observeOn(Schedulers.uiScheduler)
            .subscribe(onNext: { savedCountries in
                self.countriesArray = savedCountries
                // Sort countries array alphabetically
                self.countriesArray = self.countriesArray.sorted(by: { $0.name! < $1.name! })
                self.getViewDelegate().didGetCountries(countries: self.countriesArray)
            }, onError: { error in
                self.getViewDelegate().didFailToSaveCountriesInCoreData(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
    }
    
    private func insertCountriesToCoreData(countries: [Country]) -> Completable {
        return Completable.create { completable in
            countries.forEach({ [weak self] country in
                let countryEntity = CountryEntity(context: self!.countriesCachingManager.context)
                countryEntity.name = country.countryName!
                countryEntity.capital = country.capital!
                countryEntity.continental = country.region!
                countryEntity.flagURL = country.flag!
                countryEntity.timeZone = country.timeZones![0]
                self?.countriesCachingManager.insertRecord(record: countryEntity)
            })
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func findCountriesWith(name : String, currentDataSource : [CountryEntity]) {
        if (!isFirstTimeLoading) {
            if (name == "") {
                if (currentDataSource != countriesArray) {
                    getViewDelegate().showLoading()
                    getViewDelegate().didResetCountriesTable(countries: countriesArray)
                }
                getViewDelegate().hideLoading()
            }
            else {
                getViewDelegate().showLoading()
                filteredCountriesArray.removeAll()
                for country in countriesArray {
                    if (country.name?.range(of:name) != nil) {
                        filteredCountriesArray.append(country)
                    }
                }
                getViewDelegate().didGetSearchResults(filteredCountries: filteredCountriesArray)
                getViewDelegate().hideLoading()
            }
        }
        isFirstTimeLoading = false
    }
}
