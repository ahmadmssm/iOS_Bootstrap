//
//  BasePresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

open class BasePresenter <T> : UserDefaultsService, PresenterFunctions {
    
    public final var mViewDelegator: T!
    
    required public init (viewDelegator : T) { self.mViewDelegator = viewDelegator }
    
    public final func getViewDelegator() -> T { return mViewDelegator }
    
    open func viewControllerDidLoaded() {}

    open func viewControllerDidFinishedSettingUpUI() {}

    open func viewControllerWillRefresh() {}
    
    open func viewControllerWillDisappear() {}
    
    open func logOut() {}

    deinit { mViewDelegator = nil }
    
}

