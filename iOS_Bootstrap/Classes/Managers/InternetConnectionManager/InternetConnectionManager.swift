/*
 Copyright (c) 2014, Ashley Mills
 All rights reserved.
 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:
 1. Redistributions of source code must retain the above copyright notice, this
 list of conditions and the following disclaimer.
 2. Redistributions in binary form must reproduce the above copyright notice,
 this list of conditions and the following disclaimer in the documentation
 and/or other materials provided with the distribution.
 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 POSSIBILITY OF SUCH DAMAGE.
 */

// Ref : https://github.com/ashleymills/Reachability.swift/blob/master/Sources/Reachability.swift

import SystemConfiguration
import Foundation

enum InternetConnectionError: Error {
    case FailedToCreateWithAddress(sockaddr_in)
    case FailedToCreateWithHostname(String)
    case UnableToSetCallback
    case UnableToSetDispatchQueue
}

@available(*, unavailable, renamed: "Notification.Name.statusChanged")
private let InternetConnectionStatusChangedNotification = NSNotification.Name("InternetConnectionStatusChangedNotification")

extension Notification.Name {
    public static let statusChanged = Notification.Name("statusChanged")
}

func callback(reachability: SCNetworkReachability, flags: SCNetworkReachabilityFlags, info: UnsafeMutableRawPointer?) {
    guard let info = info else { return }
    
    let reachability = Unmanaged<InternetConnectionManager>.fromOpaque(info).takeUnretainedValue()
    reachability.statusChanged()
}

open class InternetConnectionManager {
    
    public static let getInstance = InternetConnectionManager()
    // Tracks current NetworkStatus (notReachable, reachableViaWiFi, reachableViaWWAN)
    private var reachabilityStatus: Connection = .notConnected
    //
    private var listeners = [NetworkStatusListener]()
    // Track network reachability
    private var isNetworkAvailable : Bool { return reachabilityStatus != .notConnected }
    
    
    private typealias NetworkReachable = (InternetConnectionManager) -> ()
    private typealias NetworkUnreachable = (InternetConnectionManager) -> ()
    
    public enum Connection: CustomStringConvertible {
        case notConnected, wifi, cellular
        public var description: String {
            switch self {
            case .cellular: return "Cellular"
            case .wifi: return "WiFi"
            case .notConnected: return "No Connection"
            }
        }
    }
    
    private var whenReachable: NetworkReachable?
    private var whenUnreachable: NetworkUnreachable?
    //
    @available(*, deprecated: 4.0, renamed: "allowsCellularConnection")
    private let reachableOnWWAN: Bool = true
    
    /// Set to `false` to force Reachability.connection to .none when on cellular connection (default value `true`)
    private var allowsCellularConnection: Bool
    
    // The notification center on which "reachability changed" events are being posted
    private var notificationCenter: NotificationCenter = NotificationCenter.default
    
    @available(*, deprecated: 4.0, renamed: "connection.description")
    private var currentReachabilityString: String {
        return "\(connection)"
    }
    
    @available(*, unavailable, renamed: "connection")
    private var currentReachabilityStatus: Connection {
        return connection
    }
    
    var connection: Connection {
        guard isReachableFlagSet else { return .notConnected }

        // If we're reachable, but not on an iOS device (i.e. simulator), we must be on WiFi
        guard isRunningOnDevice else { return .wifi }

        var connection = Connection.notConnected

        if !isConnectionRequiredFlagSet {
            connection = .wifi
        }

        if isConnectionOnTrafficOrDemandFlagSet {
            if !isInterventionRequiredFlagSet {
                connection = .wifi
            }
        }

        if isOnWWANFlagSet {
            if !allowsCellularConnection {
                connection = .notConnected
            } else {
                connection = .cellular
            }
        }

        return connection
    }
    
    fileprivate var previousFlags: SCNetworkReachabilityFlags?
    
    fileprivate var isRunningOnDevice: Bool = {
        
        #if arch(i386) || arch(x86_64)
            return true
        #else
           // device is true
            return false
        #endif
        
//        #if targetEnvironment(simulator)
//            return false
//        #else
//            return true
//        #endif
        
    }()
    
    fileprivate var notifierRunning = false
    fileprivate let reachabilityRef: SCNetworkReachability
    
    fileprivate let reachabilitySerialQueue = DispatchQueue(label: "com.reachability")
    
    fileprivate var usingHostname = false
    
    private init(reachabilityRef: SCNetworkReachability, usingHostname: Bool = false) {
        allowsCellularConnection = true
        self.reachabilityRef = reachabilityRef
        self.usingHostname = usingHostname
    }
    
    private convenience init?(hostname: String) {
        guard let ref = SCNetworkReachabilityCreateWithName(nil, hostname) else { return nil }
        self.init(reachabilityRef: ref, usingHostname: true)
    }
    
    
    private convenience init() {
        var zeroAddress = sockaddr()
        zeroAddress.sa_len = UInt8(MemoryLayout<sockaddr>.size)
        zeroAddress.sa_family = sa_family_t(AF_INET)
        
        let ref = SCNetworkReachabilityCreateWithAddress(nil, &zeroAddress)
        self.init(reachabilityRef: ref!)
    }
    
    deinit {
        stopNotifier()
    }
}

extension InternetConnectionManager {
    
    // MARK: - *** Notifier methods ***
    func startNotifier() throws {
        guard !notifierRunning else { return }
        
        var context = SCNetworkReachabilityContext(version: 0, info: nil, retain: nil, release: nil, copyDescription: nil)
        context.info = UnsafeMutableRawPointer(Unmanaged<InternetConnectionManager>.passUnretained(self).toOpaque())
        if !SCNetworkReachabilitySetCallback(reachabilityRef, callback, &context) {
            stopNotifier()
            throw InternetConnectionError.UnableToSetCallback
        }
        
        if !SCNetworkReachabilitySetDispatchQueue(reachabilityRef, reachabilitySerialQueue) {
            stopNotifier()
            throw InternetConnectionError.UnableToSetDispatchQueue
        }
        
        // Perform an initial check
        reachabilitySerialQueue.async {
            self.statusChanged()
        }
        
        notifierRunning = true
    }
    
    func stopNotifier() {
        defer { notifierRunning = false }
        
        SCNetworkReachabilitySetCallback(reachabilityRef, nil, nil)
        SCNetworkReachabilitySetDispatchQueue(reachabilityRef, nil)
    }
    
    // MARK: - *** Connection test methods ***
    @available(*, deprecated: 4.0, message: "Please use `connection != .none`")
    var isReachable: Bool {
        guard isReachableFlagSet else { return false }
        
        if isConnectionRequiredAndTransientFlagSet {
            return false
        }
        
        if isRunningOnDevice {
            if isOnWWANFlagSet && !reachableOnWWAN {
                // We don't want to connect when on cellular connection
                return false
            }
        }
        
        return true
    }
    
    @available(*, deprecated: 4.0, message: "Please use `connection == .cellular`")
    private var isReachableViaWWAN: Bool {
        // Check we're not on the simulator, we're REACHABLE and check we're on WWAN
        return isRunningOnDevice && isReachableFlagSet && isOnWWANFlagSet
    }
    
    @available(*, deprecated: 4.0, message: "Please use `connection == .wifi`")
    private var isReachableViaWiFi: Bool {
        // Check we're reachable
        guard isReachableFlagSet else { return false }
        
        // If reachable we're reachable, but not on an iOS device (i.e. simulator), we must be on WiFi
        guard isRunningOnDevice else { return true }
        
        // Check we're NOT on WWAN
        return !isOnWWANFlagSet
    }
    
    private var description: String {
        let W = isRunningOnDevice ? (isOnWWANFlagSet ? "W" : "-") : "X"
        let R = isReachableFlagSet ? "R" : "-"
        let c = isConnectionRequiredFlagSet ? "c" : "-"
        let t = isTransientConnectionFlagSet ? "t" : "-"
        let i = isInterventionRequiredFlagSet ? "i" : "-"
        let C = isConnectionOnTrafficFlagSet ? "C" : "-"
        let D = isConnectionOnDemandFlagSet ? "D" : "-"
        let l = isLocalAddressFlagSet ? "l" : "-"
        let d = isDirectFlagSet ? "d" : "-"
        //
        return "\(W)\(R) \(c)\(t)\(i)\(C)\(D)\(l)\(d)"
    }
}

fileprivate extension InternetConnectionManager {
    fileprivate func statusChanged() {
        guard previousFlags != flags else { return }
        
        let block = connection != .none ? whenReachable : whenUnreachable
        
        DispatchQueue.main.async {
            if self.usingHostname {
                print("USING HOSTNAME ABOUT TO CALL BLOCK")
            }
            block?(self)
            self.notificationCenter.post(name: .statusChanged, object:self)
        }
        previousFlags = flags
    }
    
    private var isOnWWANFlagSet: Bool {
        #if os(iOS)
            return flags.contains(.isWWAN)
        #else
            return false
        #endif
    }
    private var isReachableFlagSet: Bool {
        return flags.contains(.reachable)
    }
    private var isConnectionRequiredFlagSet: Bool {
        return flags.contains(.connectionRequired)
    }
    private var isInterventionRequiredFlagSet: Bool {
        return flags.contains(.interventionRequired)
    }
    var isConnectionOnTrafficFlagSet: Bool {
        return flags.contains(.connectionOnTraffic)
    }
    private var isConnectionOnDemandFlagSet: Bool {
        return flags.contains(.connectionOnDemand)
    }
    private var isConnectionOnTrafficOrDemandFlagSet: Bool {
        return !flags.intersection([.connectionOnTraffic, .connectionOnDemand]).isEmpty
    }
    private var isTransientConnectionFlagSet: Bool {
        return flags.contains(.transientConnection)
    }
    private var isLocalAddressFlagSet: Bool {
        return flags.contains(.isLocalAddress)
    }
    private var isDirectFlagSet: Bool {
        return flags.contains(.isDirect)
    }
    var isConnectionRequiredAndTransientFlagSet: Bool {
        return flags.intersection([.connectionRequired, .transientConnection]) == [.connectionRequired, .transientConnection]
    }
    
    private var flags: SCNetworkReachabilityFlags {
        var flags = SCNetworkReachabilityFlags()
        if SCNetworkReachabilityGetFlags(reachabilityRef, &flags) {
           // print("Returning flags \(flags)")
            return flags
        }
        else {
            return SCNetworkReachabilityFlags()
        }
    }
}

extension InternetConnectionManager {
    /// Called whenever there is a change in NetworkReachibility Status
    ///
    /// — parameter notification: Notification with the Reachability instance
    
    @objc private func reachabilityChanged(notification: Notification) {
        let network = notification.object as! InternetConnectionManager
        switch network.connection {
        case .notConnected:
            debugPrint("Network became unreachable")
        case .wifi:
            debugPrint("Network reachable through WiFi")
        case .cellular:
            debugPrint("Network reachable through Mobile data")
        }
        //
        for listener in listeners {
            listener.networkStatusDidChanged(status: network.connection)
        }
    }
    //
    public func addListener(listener: NetworkStatusListener){
        listeners.append(listener)
    }
    //
    public func removeListener(listener: NetworkStatusListener){
        listeners = listeners.filter{ $0 !== listener}
    }
    
    // Starts monitoring network availability status
    public func startMonitoring() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.reachabilityChanged),
                                               name: Notification.Name.statusChanged,
                                               object: self)
        //
        do { try self.startNotifier() }
        catch { debugPrint("Could not start reachability notifier") }
    }
    
    // Stop monitoring network availability status
    public func stopMonitoring(){
        self.stopNotifier()
        NotificationCenter.default.removeObserver(self,
                                                  name: Notification.Name.statusChanged,
                                                  object: self)
    }
}

extension UIDevice {
    static var isSimulator: Bool {
        return ProcessInfo.processInfo.environment["SIMULATOR_DEVICE_NAME"] != nil
    }
}

