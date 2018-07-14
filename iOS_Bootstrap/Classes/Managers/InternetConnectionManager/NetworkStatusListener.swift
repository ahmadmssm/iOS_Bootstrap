//
//  NetworkStatusListener.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//
// Protocol for listenig network status change

public protocol NetworkStatusListener : class {
    func networkStatusDidChanged(status: InternetConnectionManager.Connection)
}
