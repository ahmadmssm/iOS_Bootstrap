//
//  BaseStubedAPIsConnector.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift

open class BaseStubedAPIsConnector<T : GenericAPIs> : GenericConnector {
    
    public final var stubedAPIsProvider : APIsProvider<T>!
    
    public override init() {
        super.init()
        if enableNetworkPlugins() {
            stubedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub, plugins: configureNetworkPlugginsIfNeeded())
        }
        else {
            stubedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub)
        }
        configureErrorHandle()
    }
    
    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
    open func enableNetworkPlugins() -> Bool { return false }
    open func configureErrorHandle() { fatalError("Must Override") }
    
    open func stubedRequest(api : T) -> Single <Response> {
        return
            stubedAPIsProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
    }
    
    public final func stubedFlatRequest(api : T) -> Single <Response> {
        return stubedAPIsProvider.rx.request(api)
    }
    
    public final func requestTokenRefresh(api : T) -> Single <Response> {
        return stubedFlatRequest(api: api)
    }
    
    public final func stubedRequestWithProgress(api : T) -> Observable<ProgressResponse> {
        return stubedAPIsProvider.rx.requestWithProgress(api)
    }
    
}
