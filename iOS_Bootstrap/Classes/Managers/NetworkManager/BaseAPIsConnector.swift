//
//  BaseAPIsConnector.swift
//  Alamofire
//
//  Created by Ahmad Mahmoud on 11/5/18.
//

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
    
}
