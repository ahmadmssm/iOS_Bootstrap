//
//  DecodableExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/22/19.
//

import RxSwift

// Rx
public extension Decodable {
    func toObservable() -> Observable<Self> { return Observable.just(self) }
    func toSingle() -> Single<Self> { return Single.just(self) }
}
