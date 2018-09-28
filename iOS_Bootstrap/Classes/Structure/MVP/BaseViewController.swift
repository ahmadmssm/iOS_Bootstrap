//
//  BaseViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class BaseViewController <T, V> :
                                    UIViewController,
                                    ViewControllerCommonFeatures
                                    where T : BasePresenter<V> {
    //
    private var snackbar : TTGSnackbar? = nil
    //
    public var navigator: BaseNavigator?
    public var getPresenter : T!
    
    override open func viewDidLoad() {
        self.getPresenter = T.init(contract: self as! V)
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
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        InternetConnectionManager.getInstance.removeListener(listener: self)
    }
    
    open func initUI () { fatalError("Must Override") }

}

extension BaseViewController {
    
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
}


