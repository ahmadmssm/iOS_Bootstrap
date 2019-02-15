//
//  ConnectionResultWithGenericError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/24/18.
//

public enum ConnectionResultWithGenericError<T, E> {
    case success(T?)
    case failure(E?)
}
