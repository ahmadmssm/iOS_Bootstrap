//
//  GenericResult.swift
//
//  Created by Ahmad Mahmoud on 4/14/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//

public enum GenericResult<T> {
    case success(T?)
    case failure(String?)
}

