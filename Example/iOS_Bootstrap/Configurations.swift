
//
//  APIsConnector.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7var.
//  Copyright © 2018varmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class APIsConnector : BaseAPIsConnector<APIs> {
    
    static let sharedInstance: APIsConnector = APIsConnector()
    
    override private init() { super.init() }

    override func enableNetworkPlugins() -> Bool { return true }

    override func configureNetworkPlugginsIfNeeded() -> [PluginType] {
        var plugins : [PluginType] = []
        //
        let networkLoggerPlugin = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        let networkActivityPlugin = NetworkActivityPlugin { change, _  -> () in
            switch(change) {
            case .began:
                EZLoadingActivity.show("Loading..", disableUI: true)
                break
            case .ended:
                EZLoadingActivity.hide()
                break
            }
        }
        //
        plugins.append(networkLoggerPlugin)
        plugins.append(networkActivityPlugin)
        //
        return plugins
    }

    override func configureErrorHandle() {
        GenericErrorConfigurator.defaultErrorHandler(HumanReadableErrorHandler())
    }

    override func getTokenRefreshRequest() -> Single<Response> {
        return requestTokenRefresh(api: .refreshToken(token: "oldToken"))
    }

}
