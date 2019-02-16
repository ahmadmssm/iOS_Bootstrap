//
//  ConnectionResultWithError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

public enum ConnectionResultWithError<T> {
    case success(T?)
    case failure(Error?)
}
