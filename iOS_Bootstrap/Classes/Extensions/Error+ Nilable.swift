//
//  Error+ Nilable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/19.
//

import Foundation

public extension Optional where Wrapped == Error {
    func handleNilError(errorMessage: String, errorCode: Int? = 2000) -> Error {
        return self ?? NSError(domain: errorMessage, code: errorCode!, userInfo: nil)
    }
}
