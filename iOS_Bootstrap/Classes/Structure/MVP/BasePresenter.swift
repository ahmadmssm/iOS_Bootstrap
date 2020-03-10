//
//  BasePresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import RxSwift

open class BasePresenter<T>: UserDefaultsService, PresenterFunctions {
    
    public final weak var viewDelegate: AnyObject!
    public lazy var disposeBag: DisposeBag = { return DisposeBag() }()
    
    
    required public init (viewDelegate: T) {
        self.viewDelegate = viewDelegate as AnyObject
    }
    
    public final func getViewDelegate() -> T {
        return viewDelegate as! T
    }
    
    open func viewControllerDidLoad() {}

    open func viewControllerDidFinishedSettingUpUI() {}

    open func viewControllerWillRefresh() {}
    
    open func viewControllerWillDisappear() {}
    
    open func viewControllerDidAppear() {}

    open func logOut() {}

    deinit {
        if (viewDelegate != nil) { viewDelegate = nil }
    }
}

