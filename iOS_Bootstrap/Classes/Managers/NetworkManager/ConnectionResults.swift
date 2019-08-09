//
//  ConnectionResults.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/8/19.
//

public typealias completionHandler<T> = (ConnectionResult<T>) -> ()
public typealias completionHandlerWithErrorModel<T, E> =
    (ConnectionResultWithGenericError<T, E>) -> ()
public typealias completionHandlerWithError<T> =
    (ConnectionResultWithError<T>) -> ()
public typealias completionHandlerWithDataOrError<T, Error> =
    (ConnectionResultWithDataOrError) -> ()
