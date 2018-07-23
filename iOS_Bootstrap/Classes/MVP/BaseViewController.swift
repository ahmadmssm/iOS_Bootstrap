//
//  BaseViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class BaseViewController <T: BasePresenter> : UIViewController,
                                    BaseContractProtocol,
                                    NetworkStatusListener,
                                    PopUpProtocol {
    //
    public var navigator: BaseNavigationCoordinator?
    //
    private var snackbar : TTGSnackbar? = nil
    //
    public var presenter : T!
    override open func viewDidLoad() { self.presenter = T.init(contract: self) }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        InternetConnectionManager.getInstance.addListener(listener: self)
        //
        self.snackbar = TTGSnackbar(message: "",duration: .short)
        self.snackbar?.backgroundColor = UIColor.blue
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        InternetConnectionManager.getInstance.removeListener(listener: self)
    }
    //
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
        DispatchQueue.main.async {
            self.snackbar?.hideAllToasts()
            self.snackbar?.message = message
            self.snackbar?.duration = duration
            self.snackbar?.show()
        }
    }
}


