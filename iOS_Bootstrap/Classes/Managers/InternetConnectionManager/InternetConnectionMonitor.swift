//
//  InternetConnectionMonitor.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

import Foundation

public class InternetConnectionMonitor {
    
    static let sharedInstance = InternetConnectionMonitor()
    let connectionMonitoringKey: String = "connectionMonitoringKey"
    private var reachability : Reachability!
    
    public func enable() {
        self.reachability = try! Reachability()
        NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
    }
    
    public func start() {
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    public func stop() {
        NotificationCenter.default.removeObserver(NSNotification.Name.reachabilityChanged)
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .cellular:
            print("Network available via Cellular Data.")
            break
        case .wifi:
            print("Network available via WiFi.")
            break
        case .notAvailable:
            print("Network is not notAvailable.")
            break
        case .none:
            print("Non")
            break
        }
        EventBus.post(connectionMonitoringKey, sender: reachability)
    }
}
