//
//  BaseHTTPClient.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/17/20.
//

import Alamofire

open class BaseHTTPClient {
    
    public init() {}
    
    open func getBaseURL() -> String {
        fatalError("`getBaseURL()` function should be implemented.")
    }
    
    open func shouldEnableRefreshToken() -> Bool {
        fatalError("`shouldRefreshToken()` function should be implemented.")
    }
}

