//
//  RetryWithAuthentication.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//
// Ref : https://stackoverflow.com/questions/48558208/correct-use-of-retrywhen-operator-with-rxswift-4-0-0

import RxSwift

public extension ObservableType where E == Response {
    
    public func retryWithTokenAuthentication(sessionServiceDelegate : SessionProtocol) -> Observable<E> {
        return retryWhen { error -> Observable<Response> in
            return error.flatMap({ (error) -> Observable<Response> in
                if let moyaError : MoyaError = error as? MoyaError {
                    let statusCode = moyaError.response?.statusCode
                    if statusCode == 401 || statusCode == 403 {
                        // Token expired >> We need to re-authenticate
                        sessionServiceDelegate.refreshToken()
                    }
                    else {
                        return Observable.error(moyaError)
                    }
                }
                return Observable.error(error)
            })
        }
    }
}

//public extension PrimitiveSequence where TraitType == SingleTrait, ElementType == Response {
//
//    public func filterSuccessfulStatusAndRedirectCodes() -> Single<ElementType> {
//        return flatMap { response -> Single<ElementType> in
//            return Single.just(try response.filterSuccessfulStatusAndRedirectCodes())
//        }
//    }
//
//}
//
//public extension Response {
//    public func filterSuccessfulStatusAndRedirectCodes() throws -> Response {
//        return try filter(statusCodes: 200...399)
//    }
//}

