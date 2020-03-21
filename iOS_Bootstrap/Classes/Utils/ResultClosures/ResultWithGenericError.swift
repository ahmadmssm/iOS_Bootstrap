//
//  ResultWithGenericError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/24/18.
//

public enum ResultWithGenericError<T, E> {
    case success(T?)
    case failure(E?)
}
