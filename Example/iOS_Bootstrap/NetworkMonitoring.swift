//
//  NetworkMonitoring.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/15/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Network
import iOS_Bootstrap

class NetworkMonitoring: AppDelegateService, ConnectivityStatus {
    
    private let networkListener = NetworkMonitoringFactory()
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        return true
    }
    
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
        print("Hopa WIFI")
    }
    
    func didConnectViaCellular() {
        print("Hopa 4G")
    }
    
    func didDisconnect() {
        print("Hopa Diconnected")
    }
    
    func didGetConnectivityError(errorMessage: String) {
        print("Hopa Error")
    }
}
