//
//  IOfflineCaching.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/11/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import RxSwift

protocol IOfflineCaching {
    
    associatedtype CachableEntity
    
    func fetchItems(forceNetwork: Bool) -> Single<[CachableEntity]>

    func fetchItems(forceNetwork: Bool, page: Int) -> Single<[CachableEntity]>
    
    func fetchtemsFromNetwork(page: Int) -> Single<[CachableEntity]>
    
    func fetchtemsFromDB(page: Int) -> Single<[CachableEntity]>

    func saveItemsToLocalDB(itemsList: [CachableEntity]) -> Completable
    
    func deleteAllCachedItems() -> Completable
}

extension IOfflineCaching  {
    /// This function returns *Single<[CachableEntity]>*
    ///
    /// Usage:
    ///
    ///     println(hello("Markdown")) // Hello, Markdown!
    ///
    /// - Parameter forceNetwork: if set to true, It forces fetching data from network then saves it to local DB.
    /// - Parameter page: Can be used with pagination
    ///
    /// - Returns: `*Single<[CachableEntity]>*`.
    func fetchItems(forceNetwork: Bool = false, page: Int) -> Single<[CachableEntity]> {
        var fetchedList: [CachableEntity] = []
        if (!forceNetwork) {
            return fetchtemsFromDB(page: page)
                .flatMap({ list in
                    if (list.isEmpty) {
                        let emptyDataError = NSError(domain: "Empty Table", code: -1009, userInfo: nil)
                        return Single.error(emptyDataError)
                    }
                    return Single.just(list)
                })
                .catchError { _ in self.fetchtemsFromNetwork(page: page) }
        }
        return fetchtemsFromNetwork(page: page)
            .flatMapCompletable({ list -> Completable in
                fetchedList = list
                return self.saveItemsToLocalDB(itemsList: list)
            })
            .andThen(Single.just(fetchedList))
    }
    
    /// This function returns *Single<[CachableEntity]>*
    ///
    /// Usage:
    ///
    ///     println(hello("Markdown")) // Hello, Markdown!
    ///
    /// - Parameter forceNetwork: if set to true, It forces fetching data from network then saves it to local DB.
    ///
    /// - Returns: `*Single<[CachableEntity]>*`.
    func fetchItems(forceNetwork: Bool = false) -> Single<[CachableEntity]> {
        return fetchItems(forceNetwork: forceNetwork, page: 0)
    }
}
