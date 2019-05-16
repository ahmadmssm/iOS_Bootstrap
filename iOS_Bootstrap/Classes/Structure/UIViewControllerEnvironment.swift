//
//  UIViewControllerEnvironment.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

public protocol InternetConnectionServiceMonitoring {
    func configureViewControllerSnackBar() -> TTGSnackbar
    func snackBarMessage() -> String
    func snackbarDismissText() -> String
    func networkStatusDidChange(isConnected: Bool)
}

extension UIViewController : ViewControllerCommonFeatures {
    
    private struct AssociatedKeys {
        static var snackBar = "TTGSnackbar"
        static var networkConnectionType = "networkConnectionType"
    }
    
    public final var defaultSnackbar : TTGSnackbar? {
        get {
            return DefaultConfigurations.snackBar
        }
    }
    
    var snackBar: TTGSnackbar? {
        get {
            return getAssociatedObject(object: self, associativeKey: &AssociatedKeys.snackBar)
        }
        set {
            if let value = newValue {
                setAssociatedObject(object: self, value: value, associativeKey: &AssociatedKeys.snackBar, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    var networkConnectionType: Reachability.Connection? {
        get {
            return getAssociatedObject(object: self, associativeKey: &AssociatedKeys.networkConnectionType)
        }
        set {
            if let value = newValue {
                setAssociatedObject(object: self, value: value, associativeKey: &AssociatedKeys.networkConnectionType, policy: objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
    
    func setupViewWillAppearEssentials() {
        setContext(context: self)
        snackBar = configureViewControllerSnackBar()
        //
        let monitoringKey: String = InternetConnectionMonitor.sharedInstance.connectionMonitoringKey
        EventBus.onMainThread(self, name: monitoringKey) { [weak self] result in
            if let reachability = (result?.object as? Reachability) {
                self?.networkStatusDidChange(status: reachability.connection)
            }
        }
    }
    
    func setupViewDidDisappearEssentials() {
        snackBar?.dismiss()
        defaultSnackbar?.dismiss()
        //
        let monitoringKey: String = InternetConnectionMonitor.sharedInstance.connectionMonitoringKey
        EventBus.unregister(self, name: monitoringKey)
    }
    
    public final func getNetworkConnectionType() -> Reachability.Connection {
        return networkConnectionType!
    }
    
    public func networkStatusDidChange(status: Reachability.Connection) {
        networkConnectionType = status
        if (status == .none) {
            self.networkStatusDidChange(isConnected: false)
        }
        else if (status == .wifi || status == .cellular) {
            self.networkStatusDidChange(isConnected: true)
        }
    }
    
    @objc open func networkStatusDidChange(isConnected: Bool) {
        snackBar?.dismiss()
        defaultSnackbar?.dismiss()
        if (!isConnected) {
            snackBar?.actionText = self.snackbarDismissText()
            snackBar?.actionBlock = { snackbar in snackbar.dismiss() }
            snackBar?.message = self.snackBarMessage()
            snackBar?.duration = .forever
            DispatchQueue.main.async {
                self.snackBar?.show()
            }
        }
    }
    
    @objc open func configureViewControllerSnackBar() -> TTGSnackbar {
        let newSnackBar = TTGSnackbar(message: "",duration: .short)
        newSnackBar.backgroundColor = UIColor.blue
        return newSnackBar
    }

    @objc open func snackBarMessage() -> String {
        return "Network became unreachable"
    }

    @objc open func snackbarDismissText() -> String { return "Dismiss" }
}
    
    
    


   

