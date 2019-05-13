//
//  MoyaResponseError.swift
//  Pods
//
//  Created by Levi Bostian on 8/20/17.
//
//

import Foundation

/**
 The error type that we return to the Moya Target's error handler in your app code.
 
 In your app's code, the Error's localizedDescription will contain the error message that your MoyaResponseHandler protocol returned. This allows you to use that as a user facing error message to help the user fix their issue.
 */
public enum LucidMoyaError: Swift.Error, LocalizedError {
    /// The user encountered a networking issue with their API request.
//    case networkingError(message: String, originalError: URLError)
    case networkingError(message: String, originalError: NSError)

    /// The request was successful, but the status code is not acceptable as a successful response.
    case statusCodeError(message : String?, errorBody: String?, statusCode: Int, request: URLRequest?, response: URLResponse?)
    
    /// Moya specific error. Moya had an error mapping response body to JSON, Image, String, etc.
    case moyaError(message: String, originalError: MoyaError)
    
    
    public var errorDescription: String? {
        switch self {
        case .networkingError(let message, _):
            return message // No Internet, timeout, etc. Any of the URLError options.

//        case .networkingError(let message, _):
//            return message // No Internet, timeout, etc. Any of the URLError options.
//        case .swiftError(let message, _):
//            return message // No Internet, timeout, etc. Any of the URLError options.
        case .statusCodeError(let message, _, _, _, _):
       // case .statusCodeError(let message, _, _, response: let response):
       // case .statusCodeError(let message, _, _, let response):
        //
            return message // An error was encountered. Try again.
        case .moyaError(let message, _):
            return message // Moya specific error. Error creating Moya Endpoint, parsing JSON/Image/String, invalid status code received.
        }
    }
    
    public var statusCode: Int? {
        switch self {
        case .statusCodeError(_, _,let statusCode, _, _):
            return statusCode
        case .networkingError( _, let originalError):
            return originalError.code
        default:
            break
        }
        return 0
    }
}
