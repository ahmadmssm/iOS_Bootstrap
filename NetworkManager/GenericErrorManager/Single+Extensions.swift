//
//  Single+Extensions.swift
//  Pods
//
//  Created by Levi Bostian on 8/28/17.
//
//

import Foundation
import Moya
import RxSwift

enum MoyaResponseHandlerFatalError: Swift.Error, LocalizedError {
    case errorHandlerNotSet
    
    public var errorDescription: String? {
        switch self {
        case .errorHandlerNotSet:
            return NSLocalizedString("You did not set an error handler for Lucid.", comment: "")
        }
    }
}

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    private func getOnError(errorHandler: LucidErrorMessageProvider?) -> (Swift.Error) throws -> Single<ElementType> {
        return { (error: Swift.Error) -> Single<ElementType> in
            throw error.getLucidError()
        }
    }
    
    /// Any error that goes through the Observable stream will be caught and processed by Lucid.
    public func processErrors(errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) -> Single<ElementType> {
        return catchError(self.getOnError(errorHandler: errorHandler))
    }
}

// MARK: .filter() functions for status code filtering. 
public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    /// Filters out responses that don't fall within the given range, generating a MoyaError status code error when others are encountered.
    public func filter(statusCodes: [ClosedRange<Int>]) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filter(statusCodes: statusCodes))
        }
    }
    
    /// Filters out responses that do not have a status code >=200, <300 and don't fall within the given range, a MoyaError status code error errors when others are encountered.
    public func filterSuccessfulStatusCodes(code: Int? = nil, statusCodes: [ClosedRange<Int>] = []) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterSuccessfulStatusCodes(code: code, statusCodes: statusCodes))
        }
    }
    
    /// Filters out responses that do not have a status code >=200, <400 and don't fall within the given range, a MoyaError status code error errors when others are encountered.
    public func filterSuccessfulStatusAndRedirectCodes(code: Int? = nil, statusCodes: [ClosedRange<Int>] = []) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterSuccessfulStatusAndRedirectCodes(code: code, statusCodes: statusCodes))
        }
    }
    
}

// MARK: filterStatusCode() functions that *also* process errors through Lucid.
public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    /// Filters out responses that don't fall within the given range, generating a MoyaError status code error when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterAndProcessErrors(statusCodes: [ClosedRange<Int>], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterAndProcessErrors(statusCodes: statusCodes, errorHandler: errorHandler))
        }
    }
    
    /// Filters out responses that do not have a status code >=200, <300 and don't fall within the given range, a MoyaError status code error errors when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterSuccessfulStatusCodesAndProcessErrors(code: Int? = nil, statusCodes: [ClosedRange<Int>] = [], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterSuccessfulStatusCodesAndProcessErrors(code: code, statusCodes: statusCodes, errorHandler: errorHandler))
        }
    }
    
    /// Filters out responses that do not have a status code >=200, <400 and don't fall within the given range, a MoyaError status code error errors when others are encountered.
    /// This function will also run any errors thrown through `.getLucidError()` for you to process error using Lucid.
    public func filterSuccessfulStatusAndRedirectCodesAndProcessErrors(code: Int? = nil, statusCodes: [ClosedRange<Int>] = [], errorHandler: LucidErrorMessageProvider? = Singleton.sharedInstance.errorHandler) -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterSuccessfulStatusAndRedirectCodesAndProcessErrors(code: code, statusCodes: statusCodes, errorHandler: errorHandler))
        }
    }
    
}
