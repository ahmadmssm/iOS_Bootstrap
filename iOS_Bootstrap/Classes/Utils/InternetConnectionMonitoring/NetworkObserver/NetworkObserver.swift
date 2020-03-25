//
//  NetworkObserver.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/25/20.
//

public protocol NetworkObserver: AnyObject {
    func notify(_ isConnected: Bool, _ isWiFi: Bool?, _ error: String?)
}
