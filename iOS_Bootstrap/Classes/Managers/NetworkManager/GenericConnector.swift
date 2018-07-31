//
//  Connector.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/9/18.
//

import Foundation
import RxSwift

open class GenericConnector: NSObject, SessionProtocol {
    
    public typealias completionHandler<T> = (ConnectionResult<T>) -> ()
    public typealias completionHandlerWithErrorModel<T, E> = 
        (ConnectionResultWithGenericError<T, E>) -> ()
    //
    final var sessionDelegate : SessionProtocol!
    public final var disposeBag : DisposeBag!
    
    public override init() {
        super.init()
        //
        sessionDelegate = self
        disposeBag = DisposeBag()
    }
    
    open func getRefreshTokenObservable() -> Single<Response> {
        return Observable.empty().asSingle()
    }
    // Override this function to handle token refresh
    // Write token refresh request in this function
    public func tokenDidRefresh(response: String) {
        let dictionary = ["response" : response]
        NotificationCenter.default.post(name: .newAuthenticationToken, object: nil, userInfo: dictionary)
    }
    //
    public func didFailedToRefreshToken() {
        NotificationCenter.default.post(name: .expiredToken, object: nil)
    }
    

}
