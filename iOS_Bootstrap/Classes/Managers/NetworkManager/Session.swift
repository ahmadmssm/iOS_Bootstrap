//
//  Session.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//

import RxSwift

public protocol SessionProtocol {
    func getRefreshTokenObservable() -> Observable<Response>
    func didFailedToRefreshToken()
    func tokenDidRefresh (response : String)
}

@objc public protocol SessionService {
    @objc func didFailedToRefreshToken()
    @objc func tokenDidRefresh (response : String)
}
