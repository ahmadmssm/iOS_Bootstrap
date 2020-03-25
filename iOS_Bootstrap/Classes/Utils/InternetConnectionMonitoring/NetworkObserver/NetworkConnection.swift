//
//  NetworkConnection.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/25/20.
//

/*
 === is an identity operator, which checks whether two instances of a class point to the same memory.
 This is different from equality (==), because two objects that were created independently using the same values will be considered equal using == but not === because they are different objects.

The === operator is available only when using classes because structs are designed so they are always uniquely referenced.
*/
public class NetworkConnection: NetworkObservable {
    
    public static let shared = NetworkConnection()
    
    public private(set) var observers: [NetworkObserver] = []
    
    private init() {}
    
    public func addObserver(_ observer: NetworkObserver) {
        var exists = false
        observers.forEach { element in
            if (element === observer) {
                exists = true
            }
        }
        if (exists == false) {
            observers.append(observer)
        }
    }
    
    public func removeObserver(_ observer: NetworkObserver) {
        for (index, element) in observers.enumerated() {
            if (element === observer) {
                observers.remove (at:index)
           }
        }
    }
    
    public func notifyAllObservers(_ isConnected: Bool, _ isWiFi: Bool?, _ error: String?) {
        observers.forEach { observer in
            observer.notify(isConnected, isWiFi, error)
        }
    }
}
