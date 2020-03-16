//
//  INetworkMonitoring.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/16/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

public protocol INetworkMonitoring {
    func startMonitoring(listener: ConnectivityStatus)
    func stopMonitoring()
}
