//
//  CountriesRepo.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import RxSwift
import Resolver
import iOS_Bootstrap

class CountriesRepo: IOfflineCaching, Resolving {
    
    typealias CachableEntity = CountryEntity
    //
    @LazyInjected private var countriesCachingManager: CountriesCachingManager
    private var countriesArray: [CountryEntity] = []
    private var searchResultsArray: [CountryEntity] = []

    func fetchtemsFromNetwork(page: Int = 0) -> Single<[CountryEntity]> {
        let worldCountriesAPI: WorldCountriesAPI = resolver.resolve()
        return worldCountriesAPI
            .requestWithNoAuthentication()
            // Dealy just to show the skeleton effect :D
            .delaySubscription(2.0, scheduler: Schedulers.backgroundConcurrentScheduler)
            .map { $0.compactMap { country in
                    return self.getCountryCoreDataEntityFrom(country: country)
                }
            }
            .do(onSuccess: { [weak self] countries in
                self?.countriesArray = countries
                // Sort countries array alphabetically
                self?.countriesArray = self?.countriesArray.sorted(by: { $0.name! < $1.name! }) ?? []
            })
    }
    
    func fetchtemsFromDB(page: Int) -> Single<[CountryEntity]> {
        return countriesCachingManager.fetchAll().asSingle()
    }
    
    func saveItemsToLocalDB(itemsList: [CountryEntity]) -> Completable {
        return countriesCachingManager.insertRecordsCompletable(records: itemsList)
    }
    
    func deleteAllCachedItems() -> Completable {
        // Flush search array
        self.countriesArray.removeAll()
        return countriesCachingManager.deleteAllRecords()
    }
    
    func findCountriesWith(text : String) -> Single<[CountryEntity]> {
        if (text == "") {
            return Single.just(countriesArray)
        }
        else {
            searchResultsArray.removeAll()
            for country in countriesArray {
                if (country.name?.range(of: text) != nil) {
                    searchResultsArray.append(country)
                }
            }
            return Single.just(searchResultsArray)
        }
    }
    
    private func getCountryCoreDataEntityFrom(country: Country) -> CountryEntity {
        let countryEntity = CountryEntity(context: countriesCachingManager.context)
        countryEntity.name = country.countryName!
        countryEntity.capital = country.capital!
        countryEntity.continental = country.region!
        countryEntity.flagURL = country.flag!
        countryEntity.timeZone = country.timeZones![0]
        return countryEntity
    }
}
