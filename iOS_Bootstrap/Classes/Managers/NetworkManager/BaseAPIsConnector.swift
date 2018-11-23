//
//  BaseAPIsConnector.swift
//  Alamofire
//
//  Created by Ahmad Mahmoud on 11/5/18.
//

import RxSwift

open class BaseAPIsConnector<T : GenericAPIs> : GenericConnector {

    public final var apisProvider : APIsProvider<T>!

    public override init() {
        super.init()
        if enableNetworkPlugins() {
            apisProvider = APIsProvider<T>(plugins: configureNetworkPlugginsIfNeeded())
        }
        else {
            apisProvider = APIsProvider<T>()
        }
        configureErrorHandle()
    }

    open func configureNetworkPlugginsIfNeeded() -> [PluginType] { return [] }
    open func enableNetworkPlugins() -> Bool { return false }
    open func configureErrorHandle() { fatalError("Must Override") }
    
    open func request(api : T) -> Single <Response> {
        return
            apisProvider.rx
                .request(api)
                .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
                .refreshAuthenticationTokenIfNeeded(tokenRefreshDelegate: self)
    }
    
    public final func flatRequest(api : T) -> Single <Response> {
        return apisProvider.rx.request(api)
    }
    
    public final func requestTokenRefresh(api : T) -> Single <Response> {
        return flatRequest(api: api)
    }
    
    public final func requestWithProgress(api : T) -> Observable<ProgressResponse> {
        return apisProvider.rx.requestWithProgress(api)
    }
    
}
