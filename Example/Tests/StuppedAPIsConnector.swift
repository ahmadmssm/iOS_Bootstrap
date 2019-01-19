//
//  StuppedAPIsConnector.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RxSwift
import iOS_Bootstrap

class StuppedAPIsConnector: BaseStuppedAPIsConnector<APIs> {

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
