//
//  NewNetworkMonitoringFactory.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Network
import iOS_Bootstrap

@available(iOS 12.0, *)
class NewNetworkMonitoringFactory: INetworkMonitoring {
   
    private let monitor = NWPathMonitor()
    static var shared: NewNetworkMonitoringFactory = { return NewNetworkMonitoringFactory() }()
    
    func startMonitoring(listener: ConnectivityStatus) {
        let networkMonitoringQueue = DispatchQueue(label: "Monitor")
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("We're connected!")
                print(path.isExpensive)
                if (path.isExpensive) {
                    listener.didConnectViaCellular()
                }
                else {
                    listener.didConnectViaWIFI()
                }
            }
            else {
                print("No connection.")
                listener.didDisconnect()
            }
        }
        monitor.start(queue: networkMonitoringQueue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}

