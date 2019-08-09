//
//  CountriesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

@available(iOS 10.0, *)
class CountriesPresenter : BasePresenter<CountriesViewDelegator> {
    
    private var countriesArray : [CountryEntity]!
    private var filteredCountriesArray : [CountryEntity]!
    private var isFirstTimeLoading : Bool = true

    required init(viewDelegator: CountriesViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        countriesArray = []
        filteredCountriesArray = []
    }
    
    override func viewControllerDidLoaded() { getWorldCountries() }
    
    private func getWorldCountries() {
        Repo
            .getAllCountries()
            .subscribe(onSuccess: { [weak self] countries in
                self?
                    .processCountriesList(countries: countries)
            }) { [weak self] error in
                self?
                    .getViewDelegator()
                    .didFailToGetCountries(error: error.localizedDescription)
                print("Error : " + error.localizedDescription)
        }
        .disposed(by: getDisposeBag())
    }
    
    private func processCountriesList(countries: [Country]) {
        // Flush search array
        self.countriesArray.removeAll()
        // Flush previously saved countries
        _ = CountriesCachingManager
            .instance.deleteAllRecords()
            .andThen(insertCountriesToCoreData(countries: countries))
            .andThen(CountriesCachingManager.instance.fetchAll())
            .asObservable()
            .subscribeOn(Schedulers.backgroundConcurrentScheduler)
            .observeOn(Schedulers.uiScheduler)
            .subscribe(onNext: { savedCountries in
                self.countriesArray = savedCountries
                // Sort countries array alphabetically
                self.countriesArray = self.countriesArray.sorted(by: { $0.name! < $1.name! })
                self.getViewDelegator().didGetCountries(countries: self.countriesArray)
            }, onError: { error in
                self.getViewDelegator().didFailToSaveCountriesInCoreData(error: error.localizedDescription)
            }, onCompleted: {}, onDisposed: {})
    }
    
    private func insertCountriesToCoreData(countries: [Country]) -> Completable {
        return Completable.create { completable in
            countries.forEach({ country in
                let countryEntity = CountryEntity(context: CountriesCachingManager.instance.context)
                countryEntity.name = country.countryName!
                countryEntity.capital = country.capital!
                countryEntity.continental = country.region!
                countryEntity.flagURL = country.flag!
                countryEntity.timeZone = country.timeZones![0]
                CountriesCachingManager.instance.insertRecord(record: countryEntity)
            })
            completable(.completed)
            return Disposables.create {}
        }
    }
    
    func findCountriesWith(name : String, currentDataSource : [CountryEntity]) {
        if (!isFirstTimeLoading) {
            if (name == "") {
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
                    if (country.name?.range(of:name) != nil) {
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
