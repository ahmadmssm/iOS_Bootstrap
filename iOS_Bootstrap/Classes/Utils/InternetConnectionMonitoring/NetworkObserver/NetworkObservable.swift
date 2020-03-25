//
//  NetworkObservable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/25/20.
//

public protocol NetworkObservable {
    var observers: [NetworkObserver] { get }
    func addObserver(_ observer: NetworkObserver)
    func removeObserver(_ observer: NetworkObserver)
    func notifyAllObservers(_ isConnected: Bool, _ isWiFi: Bool?, _ error: String?)
}
