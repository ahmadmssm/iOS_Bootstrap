//
//  TokenRefresh.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/26/18.
//

import RxSwift

public protocol TokenRefresh {
    func getTokenRefreshService() -> Single<Response>
    func didFailedToRefreshToken()
    func tokenDidRefreshed (response : String)
}

@objc public protocol TokenRefreshService {
    @objc func didFailedToRefreshToken()
    @objc func tokenDidRefreshed (response : String)
}
