//
//  MoyaNetworkingError.swift
//  Pods
//
//  Created by Levi Bostian on 8/20/17.
//
//

import Foundation

/// Moya encountered a networking error with the request. These errors are all URLError types.
public enum LucidMoyaNetworkingError {
    /**
     Device not connected to Internet.
     
     One of: URLError.Code.notConnectedToInternet
     */
    case notConnectedToInternet(URLError)
    /**
     Network request failed from some error that could be from a bad network connection.
     
     One of: URLError.Code.timedOut, URLError.Code.networkConnectionLost, URLError.Code.dnsLookupFailed
     */
    case badNetworkRequest(URLError)
    /**
     Request cancelled.
     
     One of: URLError.Code.cancelled
     */
    case cancelledRequest(URLError)
    /**
     All other URLError types. In most cases, these errors are a result of a developer error. A user should not encounter these errors such as having SSL cert issues, permission issues, file issues, etc.
     
     This error could be *any other* URLError that is not already handled from other functions.
     */
    case failedNetworkRequest(URLError)
}
