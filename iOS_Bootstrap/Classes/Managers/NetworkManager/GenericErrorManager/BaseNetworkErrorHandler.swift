//
//  BaseNetworkErrorHandler.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

open class BaseNetworkErrorHandler: LucidErrorMessageProvider {
    
    open var errorMessage : String?
    
    public init() {}
    
    open func statusCodeError(_ statusCode: Int, errorBody: String?, request: URLRequest?, response: URLResponse?) -> String {
        return "Unknown error !"
    }
    
    open func networkingError(_ error: LucidMoyaNetworkingError) -> String {
        return ""
    }
    
    open func moyaError(_ error: MoyaError) -> String {
        return ""
    }
    
}
