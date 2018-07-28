//
//  RetryWithAuthentication.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//
// Ref : https://stackoverflow.com/questions/48558208/correct-use-of-retrywhen-operator-with-rxswift-4-0-0

import RxSwift

public extension ObservableType where E == Response {
    
//            return Observable.zip(e, Observable.range(start: 1, count: 3), resultSelector: { $1 })
//                .flatMap { i in
//                    return sessionServiceDelegate
//                        .hopa()?.filterSuccessfulStatusAndRedirectCodes()
//
//                        .catchError {
//                            error in
//                            log.debug("ReAuth error: \(error)")
//                            if case Error.StatusCode(let response) = error {
//                                if response.statusCode == 401 {
//                                    // Force logout after failed attempt
//                                    log.debug("401:, force user logout")
//                                    NSNotificationCenter.defaultCenter().postNotificationName(Constants.Notifications.userNotAuthenticated, object: nil, userInfo: nil)
//                                }
//                            }
//                            return Observable.error(error)
//                        }.flatMapLatest({
//                            token -> Observable<Accesstoken> in
//                            AuthenticationManager.defaultInstance().storeServiceTokenInKeychain(token)
//                            return Observable.just(token)
//                        })
         //   }
    //   }
  //  }
}


public extension Notification.Name {
    static let newAuthenticationToken = Notification.Name("newAuthenticationToken")
    static let expiredToken = Notification.Name("expiredToken")
}

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

public extension ObservableType where E == Response {
    
    /// Tries to refresh auth token on 401 & 403 errors and retry the request.
    /// If the refresh fails, the signal errors.
    public func retryWithAuthIfNeeded(sessionServiceDelegate : SessionProtocol) -> Observable<E> {
        return self.retryWhen { e -> Observable<Response> in
            return Observable
                // Retry the the same request only one time after calling refresh token request
                  .zip(e, Observable.range(start: 1, count: 1),resultSelector: { $1 })
                  .flatMap { (response) -> Observable<Response> in
                        // Token expired >> We need to re-authenticate
                        return sessionServiceDelegate
                                .getRefreshTokenObservable()
                                .asSingle()
                               // .filterSuccessfulStatusAndRedirectCodes()
                                .filterUnAuthorized()
                                .processErrors()
                                .asObservable()
                                .catchError { error -> Observable<Response> in
                                    // Log.debug("Re-authentication error : \(error)")
                                    if let lucidError : LucidMoyaError = error as? LucidMoyaError {
                                        let statusCode = lucidError.statusCode!
                                        if statusCode == 401 || statusCode == 403 {
                                            // Failed to refresh token
                                            // Logo out or do any thing related
                                            sessionServiceDelegate.didFailedToRefreshToken()
                                            return Observable.error(lucidError)
                                        }
                                        else { return Observable.error(error) }
                                    }
                                    return Observable.error(error.getLucidError())
                                    // return Observable.empty()
                            }
                            .flatMapLatest({ (s) -> Observable<Response> in
                                sessionServiceDelegate.tokenDidRefresh(response: try! s.mapString())
                                return Observable.just(s)
                            })
            }
        }
    }
}
