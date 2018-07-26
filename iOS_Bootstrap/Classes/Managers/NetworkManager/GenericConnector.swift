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
    public final var sessionDelegate : SessionProtocol!
    public final var disposeBag : DisposeBag!
    
    public override init() {
        super.init()
        //
        sessionDelegate = self
        disposeBag = DisposeBag()
    }
    
    // Override this functio to handle token refresh
    // Write token refresh request in this function
    open func refreshToken() {}
}
