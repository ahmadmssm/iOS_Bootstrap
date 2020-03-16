//
//  LegacyetworkMonitoringFactory.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class LegacyetworkMonitoringFactory: INetworkMonitoring {
   
    private let reachability = try! Reachability()
    static var shared: LegacyetworkMonitoringFactory = { return LegacyetworkMonitoringFactory() }()
    
    open func startMonitoring(listener: ConnectivityStatus) {
        reachability.whenReachable = { reachability in
            if reachability.connection == .wifi {
                print("Reachable via WiFi")
                listener.didConnectViaWIFI()
            }
            else {
                print("Reachable via Cellular")
                listener.didConnectViaCellular()
            }
        }
        reachability.whenUnreachable = { _ in
            print("Not reachable")
            listener.didDisconnect()
        }
        do {
            try reachability.startNotifier()
        }
        catch {
            print("Error starting Reachability...")
            listener.didGetConnectivityError(errorMessage: error.localizedDescription)
        }
    }
    
    open func stopMonitoring() {
        reachability.stopNotifier()
    }
}
