//
//  BasePresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import RxSwift

open class BasePresenter <T> : UserDefaultsService, PresenterFunctions {
    
    public final var mViewDelegator: T!
    private var disposeBag : DisposeBag!
    
    required public init (viewDelegator : T) { self.mViewDelegator = viewDelegator }
    
    public final func getViewDelegator() -> T { return mViewDelegator }
    
    public final func getDisposeBag() -> DisposeBag {
        if (disposeBag == nil) { disposeBag = DisposeBag() }
        return disposeBag
    }
    
    open func viewControllerDidLoaded() {}

    open func viewControllerDidFinishedSettingUpUI() {}

    open func viewControllerWillRefresh() {}
    
    open func viewControllerWillDisappear() {}
    
    open func viewControllerDidAppear() {}

    open func logOut() {}

    deinit {
        if (mViewDelegator != nil) { mViewDelegator = nil }
        if (disposeBag != nil) { disposeBag = nil }
    }
    
}

