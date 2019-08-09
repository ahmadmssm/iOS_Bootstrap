//
//  AppRestClient.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/24/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class AppRestClient<API>: BaseRestClient<API, AppErrorHandler>
                          where API: GenericAPIs {
    
    override func enableNetworkPlugins() -> Bool { return true }
    
    override func configureNetworkPlugginsIfNeeded() -> [PluginType] {
        let networkLoggerPlugin = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        let networkActivityPlugin = NetworkActivityPlugin { [weak self] change, _ in
            switch(change) {
            case .began:
                if ((self?.isLoadingActivityEnabled)!) { self?.showLoader() }
                break
            case .ended:
                if ((self?.isLoadingActivityEnabled)!) { self?.hideLoader() }
                break
            }
        }
        let networkCachingPlugin: CachingPolicyPlugin = CachingPolicyPlugin()
        //
        var plugins : [PluginType] = []
        plugins.append(networkLoggerPlugin)
        plugins.append(networkActivityPlugin)
        plugins.append(networkCachingPlugin)
        //
        return plugins
    }
    
    private func showLoader() {
        EZLoadingActivity.show("loading".localized(), disableUI: true)
    }
    
    private func hideLoader() {
        EZLoadingActivity.hide()
    }
    
    override func getTokenRefreshRequest() -> Single<Response> {
        return RefreshTokenAPI.request()
    }
}
