//
//  Response+Extensions.swift
//  Pods
//
//  Created by Levi Bostian on 8/28/17.
//
//

import Foundation
import Moya

/// These functions exist for convenience. Moya treats *all* status codes the same by default. No matter what the code is, Moya considers it a successful call. With that in mind, Lucid provides these functions to filter the response by invalid status codes and throws a Moya status code if the response is not within the valid status code range.
public extension Response {
    
    /// Filters out responses that don't fall within the given range, generating a MoyaError status code error when others are encountered.
    public func filter(statusCodes: [ClosedRange<Int>]) throws -> Response {
        var successfulStatusCode = false
        statusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self)
    }
    
    /// Filters out responses that do not have a status code >=200, <300 and don't fall within the given range, generating a MoyaError status code error when others are encountered.
    public func filterSuccessfulStatusCodes(code: Int? = nil, statusCodes: [ClosedRange<Int>] = []) throws -> Response {
        var allStatusCodes = statusCodes
        
        if let code = code { allStatusCodes.append(code...code) }
        allStatusCodes.append(200...299)
        
        var successfulStatusCode = false
        allStatusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self)
    }
    
    /// Filters out responses that do not have a status code >=200, <400 and don't fall within the given range, generating a MoyaError status code error when others are encountered.
    public func filterSuccessfulStatusAndRedirectCodes(code: Int? = nil, statusCodes: [ClosedRange<Int>] = []) throws -> Response {
        var allStatusCodes = statusCodes
        
        if let code = code { allStatusCodes.append(code...code) }
        allStatusCodes.append(200...399)
        
        var successfulStatusCode = false
        allStatusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self)
    }
    
}

// MARK: .filter() functions that also process errors through Lucid.
public extension Response {
    
    /// Filters out responses that don't fall within the given range, generating a MoyaError status code error when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterAndProcessErrors(statusCodes: [ClosedRange<Int>], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) throws -> Response {
        var successfulStatusCode = false
        statusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self).getLucidError(errorHandler: errorHandler)
    }
    
    /// Filters out responses that do not have a status code >=200, <300 and don't fall within the given range, generating a MoyaError status code error when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterSuccessfulStatusCodesAndProcessErrors(code: Int? = nil, statusCodes: [ClosedRange<Int>] = [], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) throws -> Response {
        var allStatusCodes = statusCodes
        
        if let code = code { allStatusCodes.append(code...code) }
        allStatusCodes.append(200...299)
        
        var successfulStatusCode = false
        allStatusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self).getLucidError(errorHandler: errorHandler)
    }
    
    /// Filters out responses that do not have a status code >=200, <400 and don't fall within the given range, generating a MoyaError status code error when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterSuccessfulStatusAndRedirectCodesAndProcessErrors(code: Int? = nil, statusCodes: [ClosedRange<Int>] = [], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) throws -> Response {
        var allStatusCodes = statusCodes
        
        if let code = code { allStatusCodes.append(code...code) }
        allStatusCodes.append(200...399)
        
        var successfulStatusCode = false
        allStatusCodes.forEach { (statsCodesSet: ClosedRange<Int>) in
            if statsCodesSet.contains(statusCode) {
                successfulStatusCode = true
            }
        }
        
        if successfulStatusCode {
            return self
        }
        throw MoyaError.statusCode(self).getLucidError(errorHandler: errorHandler)
    }
    
}
