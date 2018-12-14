//
//  NetworkConnectionConfiguration.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/25/18.
//
// Ref :
// https://stackoverflow.com/questions/40116000/how-can-i-set-timeout-for-requests-using-moya-pod
// https://medium.com/bobo-shone/how-to-set-timeout-or-http-header-in-moya-a5f6b1cb8ef2
//

import Alamofire

class NetworkConnectionConfiguration: Alamofire.SessionManager {
    
    private static let configuration = URLSessionConfiguration.default
    
    public static func setDefaultConfiguration() -> Alamofire.SessionManager {
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = 60
        configuration.timeoutIntervalForResource = 60
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return Alamofire.SessionManager(configuration: configuration)
    }
    
    public static func setDefaultConfigurationWithTimeout(requestTimeOut : Double, responseTimeOut : Double) -> Alamofire.SessionManager {
        configuration.httpAdditionalHeaders = Alamofire.SessionManager.defaultHTTPHeaders
        configuration.timeoutIntervalForRequest = requestTimeOut
        configuration.timeoutIntervalForResource = responseTimeOut
        configuration.requestCachePolicy = .useProtocolCachePolicy
        return Alamofire.SessionManager(configuration: configuration)
    }
}
