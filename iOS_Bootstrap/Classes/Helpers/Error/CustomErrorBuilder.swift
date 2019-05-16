//
//  CustomErrorBuilder.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

open class CustomErrorBuilder {
    open class func initWith(_ errorMessage: String, _ statusCode: Int) -> NSError {
        return NSError(domain: errorMessage, code: statusCode, userInfo: nil)
    }
}
