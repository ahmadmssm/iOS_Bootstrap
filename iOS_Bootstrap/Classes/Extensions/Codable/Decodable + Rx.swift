//
//  Decodable + Rx.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/22/19.
//

import RxSwift

public extension Decodable {
    public func toObservable() -> Observable<Self> { return Observable.just(self) }
    public func toSingle() -> Single<Self> { return Single.just(self) }
}
