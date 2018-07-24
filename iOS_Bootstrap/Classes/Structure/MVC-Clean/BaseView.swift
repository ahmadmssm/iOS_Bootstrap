//
//  BaseView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

import UIKit

open class BaseView:
                        UIViewController,
ViewControllerCommonFeatures {
    
    //
    private var snackbar : TTGSnackbar? = nil
    //
    public var navigator: BaseNavigationCoordinator?
    
   // public var controller : C!
    
    override open func viewDidLoad() {
      //  self.controller = C.init(view: self as UIViewController)
    }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        InternetConnectionManager.getInstance.addListener(listener: self)
        //
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
        //
        //        DispatchQueue.main.async {
        //            self.snackbar?.hideAllToasts()
        //            self.snackbar?.message = message
        //            self.snackbar?.duration = duration
        //            self.snackbar?.show()
        //        }
        Log.warning(message)
    }
    
}
