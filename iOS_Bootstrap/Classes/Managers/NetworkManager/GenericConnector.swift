//
//  Connector.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/9/18.
//

import Foundation
import RxSwift

public typealias completionHandler<T> = (ConnectionResult<T>) -> ()
public typealias completionHandlerWithErrorModel<T, E> =
    (ConnectionResultWithGenericError<T, E>) -> ()
public typealias completionHandlerWithError<T, Error> =
    (ConnectionResultWithError<T, Error>) -> ()


open class GenericConnector: NSObject, TokenRefresh, UserDefaultsService {
    
    private final var tokenRefreshDelegate : TokenRefresh!
    public var networkRequest: Disposable?
    
    public override init() {
        super.init()
        tokenRefreshDelegate = self
    }
    
    open func getTokenRefreshRequest() -> Single<Response> {
        return Observable.empty().asSingle()
    }
    
    public final func cancelRequest () { networkRequest?.cancelRequest() }
    
    public final func tokenDidRefreshed(response: String) {
        let dictionary = ["response" : response]
        NotificationCenter.default.post(name: .newAuthenticationToken, object: nil, userInfo: dictionary)
    }
    //
    public final func didFailedToRefreshToken() {
        NotificationCenter.default.post(name: .expiredToken, object: nil)
    }

}
