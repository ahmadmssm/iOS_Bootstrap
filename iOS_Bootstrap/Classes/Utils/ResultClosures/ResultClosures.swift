//
//  ResultClosures.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/8/19.
//

public typealias completionHandler<T> = (GenericResult<T>) -> ()
public typealias completionHandlerWith<T, E> =
    (ResultWithGenericError<T, E>) -> ()
public typealias completionHandlerWithError<T> =
    (ResultWithError<T>) -> ()
public typealias completionHandlerWithDataOrError<T, Error> =
    (ResultWithDataOrError) -> ()
