//
//  BaseStuppedAPIsConnector.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift

open class BaseStuppedAPIsConnector<T : GenericAPIs> : GenericConnector {
    
    public final var stuppedAPIsProvider : APIsProvider<T>!
    
    public override init() {
        super.init()
        if enableNetworkPlugins() {
            stuppedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub, plugins: configureNetworkPlugginsIfNeeded())
        }
        else {
            stuppedAPIsProvider = APIsProvider<T>(stubClosure: MoyaProvider.immediatelyStub)
        }
        configureErrorHandle()
    }
    
    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
    open func enableNetworkPlugins() -> Bool { return false }
    open func configureErrorHandle() { fatalError("Must Override") }
    
    open func stuppedRequest(api : T) -> Single <Response> {
        return
            stuppedAPIsProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
    }
    
    public final func stuppedFlatRequest(api : T) -> Single <Response> {
        return stuppedAPIsProvider.rx.request(api)
    }
    
    public final func requestTokenRefresh(api : T) -> Single <Response> {
        return stuppedFlatRequest(api: api)
    }
    
    public final func stuppedRequestWithProgress(api : T) -> Observable<ProgressResponse> {
        return stuppedAPIsProvider.rx.requestWithProgress(api)
    }
    
}
