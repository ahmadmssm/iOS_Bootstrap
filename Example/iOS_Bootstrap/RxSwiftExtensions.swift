//
//  RxSwiftExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import RxSwift
import iOS_Bootstrap

extension Observable {
    func applyThreadingConfig() -> Observable {
        return self
            .subscribe(on: RxSchedulers.backgroundConcurrentScheduler)
            .observe(on: RxSchedulers.main)
    }
}

extension PrimitiveSequence {
    func applyThreadingConfig() -> PrimitiveSequence {
        return self
            .subscribe(on: RxSchedulers.backgroundConcurrentScheduler)
            .observe(on: RxSchedulers.main)
    }
}

extension Completable {
    func applyThreadingConfig() -> Completable {
        return self
            .subscribe(on: RxSchedulers.backgroundConcurrentScheduler)
            .observe(on: RxSchedulers.main)
    }
}
