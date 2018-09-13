//
//  RetryWithAuthentication.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//
// Ref :
// https://stackoverflow.com/questions/48558208/correct-use-of-retrywhen-operator-with-rxswift-4-0-0
// http://sapandiwakar.in/refresh-oauth-tokens-using-moya-rxswift/
// https://github.com/Moya/Moya/issues/1177

import RxSwift

public extension Notification.Name {
    static let newAuthenticationToken = Notification.Name("newAuthenticationToken")
    static let expiredToken = Notification.Name("expiredToken")
}

//public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
//    public func showLoading() -> Single<ElementType> {
//        Log.debug("Hopa")
//        return Observable.empty().asSingle()
//    }
//}

public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    public func filterUnAuthorized() -> Single<ElementType> {
        return flatMap { response -> Single<ElementType> in
            return Single.just(try response.filterUnAuthorized())
        }
    }
}

public extension Response {
    func filterUnAuthorized() throws -> Response {
        if (self.statusCode == 401 || self.statusCode == 403) {
            throw MoyaError.statusCode(self)
        }
        return self
    }
}

// Using Observable
public extension ObservableType where E == Response {
    
    // Tries to refresh auth token on 401 error and retry the request.
    // If the refresh fails it returns an error .
    public func refreshAuthenticationTokenIfNeeded(sessionServiceDelegate : SessionProtocol) -> Observable<E> {
        return
            // Retry and process the request if any error occurred
            self.retryWhen { responseFromFirstRequest in
                responseFromFirstRequest.flatMap { originalRequestResponseError -> Observable<Response> in
                    if let lucidErrorOfOriginalRequest : LucidMoyaError = originalRequestResponseError as? LucidMoyaError {
                        let statusCode = lucidErrorOfOriginalRequest.statusCode!
                       // if statusCode == 401 || statusCode == 403 {
                        if statusCode == 401 {
                            // Token expired >> Call refresh token request
                            return sessionServiceDelegate
                                .getTokenRefreshService()
                                .filterSuccessfulStatusCodesAndProcessErrors()
                                .asObservable()
                                .catchError { tokeRefreshRequestError -> Observable<Response> in
                                    // Failed to refresh token
                                    if let lucidErrorOfTokenRefreshRequest : LucidMoyaError = tokeRefreshRequestError as? LucidMoyaError {
                                        //
                                        // Logout or do any thing related
                                        sessionServiceDelegate.didFailedToRefreshToken()
                                        //
                                        return Observable.error(lucidErrorOfTokenRefreshRequest)
                                    }
                                    return Observable.error(tokeRefreshRequestError)
                                }
                                .flatMapLatest { tokenRefreshResponseString -> Observable<Response> in
                                    // Refresh token response string
                                    // Save new token locally to use with any request from now on
                                    sessionServiceDelegate.tokenDidRefresh(response: try! tokenRefreshResponseString.mapString())
                                    // Retry the original request one more time
                                    return self.retry(1)
                            }
                        }
                        else {
                            // Retuen errors other than 401 & 403 of the original request
                            return Observable.error(lucidErrorOfOriginalRequest)
                        }
                    }
                    // Return any other error
                    return Observable.error(originalRequestResponseError)
                }
        }
    }
    
}

// Using Single
extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
    
    // Tries to refresh auth token on 401 error and retry the request.
    // If the refresh fails it returns an error .
    public func refreshAuthenticationTokenIfNeeded(sessionServiceDelegate : SessionProtocol) -> Single<Response> {
        return
            // Retry and process the request if any error occurred
            self.retryWhen { responseFromFirstRequest in
                responseFromFirstRequest.flatMap { originalRequestResponseError -> PrimitiveSequence<SingleTrait, ElementType> in
                        if let lucidErrorOfOriginalRequest : LucidMoyaError = originalRequestResponseError as? LucidMoyaError {
                        let statusCode = lucidErrorOfOriginalRequest.statusCode!
                       // if statusCode == 401 || statusCode == 403 {
                        if statusCode == 401 {
                            // Token expired >> Call refresh token request
                            return sessionServiceDelegate
                                .getTokenRefreshService()
                                .filterSuccessfulStatusCodesAndProcessErrors()
                                .catchError { tokeRefreshRequestError -> Single<Response> in
                                    // Failed to refresh token
                                    if let lucidErrorOfTokenRefreshRequest : LucidMoyaError = tokeRefreshRequestError as? LucidMoyaError {
                                        //
                                        // Logout or do any thing related
                                        sessionServiceDelegate.didFailedToRefreshToken()
                                        //
                                        return Single.error(lucidErrorOfTokenRefreshRequest)
                                    }
                                    return Single.error(tokeRefreshRequestError)
                                }
                                .flatMap { tokenRefreshResponseString -> Single<Response> in
                                    // Refresh token response string
                                    // Save new token locally to use with any request from now on
                                    sessionServiceDelegate.tokenDidRefresh(response: try! tokenRefreshResponseString.mapString())
                                    // Retry the original request one more time
                                    return self.retry(1)
                            }
                        }
                        else {
                            // Retuen errors other than 401 & 403 of the original request
                            return Single.error(lucidErrorOfOriginalRequest)
                        }
                    }
                    // Return any other error
                    return Single.error(originalRequestResponseError)
                }
        }
    }
    
}

 
