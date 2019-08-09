//
//  AppErrorHandler.swift
//  AppErrorHandler.swift
//
//  Created by Ahmad Mahmoud on 4/14/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//

import iOS_Bootstrap

class AppErrorHandler: BaseNetworkErrorHandler<AppErrorModel> {
    
    override func statusCodeError(_ statusCode: Int,
                                  errorBody: String?,
                                  request: URLRequest?,
                                  response: URLResponse?) -> String {
        serializeError(errorBody: errorBody!)
        //
        switch statusCode {
        case 401:
            errorMessage = "Not authorised ! " + errorBody!
        case 404:
            errorMessage = "Not found !"
        case 507:
            errorMessage = getNetworkError()
                .setStatusCode(statusCode: -1008)
                .setDescription(description: "description")
                .setResponse(response: response.debugDescription)
                .toString()
        default:
            errorMessage = errorBody
            break
        }
        return errorMessage!
    }


    override func networkingError(_ error: LucidMoyaNetworkingError) -> String {
        switch error {
        case .notConnectedToInternet(let networkError):
            errorMessage = networkError.localizedDescription
        default:
            errorMessage = "Unknown error"
        }
        return errorMessage!.description
    }

    override func moyaError(_ error: MoyaError) -> String {
        return ""
    }
}
