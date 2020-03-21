//
//  ResultWithDataOrError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

public enum ResultWithDataOrError {
    case success(Data)
    case failure(Error?)
}
