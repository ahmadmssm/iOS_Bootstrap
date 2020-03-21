//
//  SwiftErrorExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

public extension Swift.Error {
    func toAlamofireError() -> AlamofireError? {
        return self as? AlamofireError
    }
}
