//
//  BaseView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

import UIKit


open class BaseView : UIViewController, ViewControllerCommonFeatures {
    
    public var snackbar : TTGSnackbar? = nil
    public var navigator: BaseNavigator?

    open func getController<C>() -> C? {
        return nil
    }
    
    override open func viewDidLoad() {
        initController()
        initUI()
    }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        setContext(context: self)
        InternetConnectionManager.getInstance.addListener(listener: self)
        configureSnackBar()
    }
   
    open func initUI () { fatalError("Must Override") }
    open func initController () { fatalError("Must Override") }

}


public extension BaseView {
    
    func configureSnackBar() {
        self.snackbar = TTGSnackbar(message: "",duration: .short)
        self.snackbar?.backgroundColor = UIColor.blue
    }
    
    public func networkStatusDidChanged(status: InternetConnectionManager.Connection) {
        var message : String = ""
        var duration : TTGSnackbarDuration = .short
        
        switch status {
        case .notConnected:
            message = "Network became unreachable"
            duration = .forever
        case .wifi:
            message = "Network reachable through WiFi"
        case .cellular:
            message = "Network reachable through Mobile data"
        }
        self.snackbar?.hideAllToasts()
        self.snackbar?.message = message
        self.snackbar?.duration = duration
        self.snackbar?.show()
        Log.warning(message)
    }
    
    func showLoading() {}
    func hideLoading() {}
}
