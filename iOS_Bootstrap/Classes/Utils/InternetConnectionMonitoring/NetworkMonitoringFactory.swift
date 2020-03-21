//
//  NetworkMonitoringFactory.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

open class NetworkMonitoringFactory: INetworkMonitoring {
    
    public init() {}
    
    open func startMonitoring(listener: ConnectivityStatus) {
        if #available(iOS 12.0, *) {
            NewNetworkMonitoringFactory.shared.startMonitoring(listener: listener)
        }
        else {
            LegacyetworkMonitoringFactory.shared.startMonitoring(listener: listener)
        }
    }
    
    open func stopMonitoring() {
        if #available(iOS 12.0, *) {
            NewNetworkMonitoringFactory.shared.stopMonitoring()
        }
        else {
            LegacyetworkMonitoringFactory.shared.stopMonitoring()
        }
    }
}
