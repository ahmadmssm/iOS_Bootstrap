//
//  BasePresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//


open class BasePresenter <T> : UserDefaultsService {
    
    public final var getViewDelegator: T!
    
    // public init (contract : T) { self.getViewDelegator = contract }
    
    required public init () {}
    
    public final func attachView(contract : T) { self.getViewDelegator = contract }
    
    deinit { getViewDelegator = nil }

    open func logOut() {}
    
}

