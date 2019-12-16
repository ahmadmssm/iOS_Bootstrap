//
//  BaseViewModel.swift
//  DecadeOfMoviesSample
//
//  Created by Ahmad Mahmoud on 6/22/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

open class AppViewModel: UserDefaultsService, PresenterFunctions {
    
    private var disposeBag : DisposeBag!
    
    
    required public init () {}

    public final func getDisposeBag() -> DisposeBag {
        if (disposeBag == nil) { disposeBag = DisposeBag() }
        return disposeBag
    }
    
    open func viewControllerDidLoad() {}
    
    open func viewControllerDidFinishedSettingUpUI() {}
    
    open func viewControllerWillRefresh() {}
    
    open func viewControllerWillDisappear() {}
    
    open func viewControllerDidAppear() {}
    
    open func logOut() {}
    
    deinit {
        if (disposeBag != nil) { disposeBag = nil }
    }
}
