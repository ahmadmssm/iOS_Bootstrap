//
//  AlamofireError.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/18/20.
//

import Alamofire

public enum AlamofireError: Swift.Error, LocalizedError {
    /// The user encountered a networking issue with their API request.
    case networkError(message: String, originalError: NSError, request: URLRequest?, response: URLResponse?)

    /// The request was successful, but the status code is not acceptable as a successful response.
    case statusCodeError(message: String?, statusCode: Int, request: URLRequest?, response: URLResponse?)
    
    /// Alamofire specific error. Alamofire had an error mapping response body to JSON, Image, String, etc.
    case alamofireError(message: String, originalError: AFError)
    
    public var errorDescription: String? {
        switch self {
        case .networkError(let message, _, _, _):
            return message // No Internet, timeout, etc. Any of the URLError options.

//        case .networkingError(let message, _):
//            return message // No Internet, timeout, etc. Any of the URLError options.
//        case .swiftError(let message, _):
//            return message // No Internet, timeout, etc. Any of the URLError options.
        case .statusCodeError(let message, _, _, _):
       // case .statusCodeError(let message, _, _, response: let response):
       // case .statusCodeError(let message, _, _, let response):
        //
            return message // An error was encountered. Try again.
        case .alamofireError(let message, _):
            return message // Alamofire specific error. Error creating Alamofire Endpoint, parsing JSON/Image/String, invalid status code received.
        }
    }
    
    public var statusCode: Int? {
        switch self {
        case .statusCodeError(_, let statusCode, _, _):
            return statusCode
        case .networkError(_, let originalError, _, _):
            return originalError.code
        default:
            break
        }
        return 0
    }
}
