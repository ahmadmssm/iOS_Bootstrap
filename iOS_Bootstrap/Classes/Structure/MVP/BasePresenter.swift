//
//  BasePresenter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//


open class BasePresenter <T> {
    
    public final let viewDelegator: T!
    
    required public init (contract : T) {
        self.viewDelegator = contract 
    }
}

