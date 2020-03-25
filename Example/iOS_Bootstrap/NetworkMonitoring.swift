//
//  NetworkMonitoring.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/15/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class NetworkMonitoring: AppDelegateService, ConnectivityStatus {
    
    private let networkListener = NetworkMonitoringFactory()
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        networkListener.startMonitoring(listener: self)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        networkListener.stopMonitoring()
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func didConnectViaWIFI() {
        print("Connectivity : WIFI")
        notifiy(isConnected: true, isWiFi: true, error: nil)
    }
    
    func didConnectViaCellular() {
        print("Connectivity : 4G")
        notifiy(isConnected: true, isWiFi: false, error: nil)
    }
    
    func didDisconnect() {
        notifiy(isConnected: false, isWiFi: nil, error: nil)
        print("Connectivity : Diconnected")
    }
    
    func didGetConnectivityError(errorMessage: String) {
        notifiy(isConnected: false, isWiFi: nil, error: nil)
        print("Connectivity : Error")
    }
    
    private func notifiy(isConnected: Bool, isWiFi: Bool?, error: String?) {
        NetworkConnection.shared.notifyAllObservers(isConnected, isWiFi, error)
    }
}

