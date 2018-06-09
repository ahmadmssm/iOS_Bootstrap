//
//  Error+Extensions.swift
//  Pods
//
//  Created by Levi Bostian on 8/28/17.
//
//

import Foundation
import Moya

public extension Swift.Error {
    
    private func errorHandlerNotSet() {
        fatalError("You did not provide an error handler for Lucid.")
    }
    
    /// Take the error that Moya returned to you after performing the networking request to get a better, human readable error message `LucidMoyaResponseError`.
    public func getLucidError(errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) -> Swift.Error {
        guard let errorHandler = errorHandler else {
            errorHandlerNotSet()
            // this code below exists only to make the compiler happy. Really, it should never run as a fatal error is thrown above but the swift compiler doesn't consider that a break.
            return LucidMoyaError.moyaError(message: "this should never run", originalError: self as! MoyaError)
        }
        
        if let moyaError = self as? MoyaError {
            switch moyaError {
            case MoyaError.statusCode(let response):
                let errorMessage = errorHandler.statusCodeError(response.statusCode, request: response.request, response: response.response)
                
                return LucidMoyaError.statusCodeError(message: errorMessage, statusCode: response.statusCode, request: response.request, response: response.response)
            case MoyaError.imageMapping, MoyaError.jsonMapping, MoyaError.requestMapping, MoyaError.stringMapping, MoyaError.parameterEncoding, MoyaError.encodableMapping, MoyaError.objectMapping:
                let errorMessage = errorHandler.moyaError(moyaError)
                
                return LucidMoyaError.moyaError(message: errorMessage, originalError: moyaError)
            case MoyaError.underlying(let error):
                if let urlError = error as? URLError {
                    switch urlError.code {
                    case URLError.Code.notConnectedToInternet:
                        let errorMessage = errorHandler.networkingError(LucidMoyaNetworkingError.notConnectedToInternet(urlError))
                        
                        return LucidMoyaError.networkingError(message: errorMessage, originalError: urlError)
                    case URLError.Code.timedOut, URLError.Code.networkConnectionLost, URLError.Code.dnsLookupFailed:
                        let errorMessage = errorHandler.networkingError(LucidMoyaNetworkingError.badNetworkRequest(urlError))
                        
                        return LucidMoyaError.networkingError(message: errorMessage, originalError: urlError)
                    case URLError.Code.cancelled:
                        let errorMessage = errorHandler.networkingError(LucidMoyaNetworkingError.cancelledRequest(urlError))
                        
                        return LucidMoyaError.networkingError(message: errorMessage, originalError: urlError)
                    default:
                        let errorMessage = errorHandler.networkingError(LucidMoyaNetworkingError.failedNetworkRequest(urlError))
                        
                        return LucidMoyaError.networkingError(message: errorMessage, originalError: urlError)
                    }
                } else {
                    // return self so we allow any custom errors (not MoyaErrors) thrown to be passed through.
                    return self
                }
            }
        } else {
            // return self so we allow any custom errors (not MoyaErrors) thrown to be passed through.
            return self
        }
    }
    
}
