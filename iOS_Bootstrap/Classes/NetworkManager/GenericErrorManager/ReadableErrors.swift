//
//  ReadableErrors.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Moya

open class GenericErrorHandler: LucidErrorMessageProvider {
    
    
    public var errorMessage : String?
    
    public func statusCodeError(_ statusCode: Int, request: URLRequest?, response: URLResponse?) -> String {
        return "Unknown error !"
    }
    
    public func networkingError(_ error: LucidMoyaNetworkingError) -> String {
        return ""
    }
    
    public func moyaError(_ error: MoyaError) -> String {
        return ""
    }
}
