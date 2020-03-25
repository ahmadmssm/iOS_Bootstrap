//
//  SearchBarExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import iOS_Bootstrap

extension UISearchBar {
    func setUpSearchBarListener(action: @escaping (_ searchText: String) -> Void, disposeBag: DisposeBag) {
        self.rx
            .text
            .orEmpty.skip(1)
            .debounce(RxTimeInterval.seconds(Int(1.5)), scheduler: RxSchedulers.main)
            // Only emits if the current value is different from the last one
            .distinctUntilChanged()
            .subscribe(onNext: { searchText in
                // Here we will be notified of every new value
                action(searchText)
            })
            .disposed(by: disposeBag)
    }
}
