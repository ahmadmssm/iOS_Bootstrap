//
//  NewNetworkMonitoringFactory.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Network

@available(iOS 12.0, *)
open class NewNetworkMonitoringFactory: INetworkMonitoring {
   
    private let monitor = NWPathMonitor()
    private let networkMonitoringQueue = DispatchQueue(label: "Monitor")

    static var shared: NewNetworkMonitoringFactory = { return NewNetworkMonitoringFactory() }()
    
    open func startMonitoring(listener: ConnectivityStatus) {
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                if (path.isExpensive) {
                    listener.didConnectViaCellular()
                }
                else {
                    listener.didConnectViaWIFI()
                }
            }
            else {
                listener.didDisconnect()
            }
        }
        monitor.start(queue: networkMonitoringQueue)
    }
    
    open func stopMonitoring() {
        monitor.cancel()
    }
}

