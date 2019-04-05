//
//  Decodable + Rx.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/22/19.
//

import RxSwift

public extension Decodable {
    func toObservable() -> Observable<Self> { return Observable.just(self) }
    func toSingle() -> Single<Self> { return Single.just(self) }
}
