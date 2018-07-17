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
    public weak var navigator: BaseNavigationCoordinator?
    //
    public var presenter : T!
    override open func viewDidLoad() { self.presenter = T.init(contract: self) }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        InternetConnectionManager.getInstance.addListener(listener: self)
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        InternetConnectionManager.getInstance.removeListener(listener: self)
    }
    //
    public func networkStatusDidChanged(status: InternetConnectionManager.Connection) {
        var snackbar : TTGSnackbar? = nil
        var message : String = ""
        var duration : TTGSnackbarDuration
        switch status {
        case .notConnected:
            message = "Network became unreachable"
            duration = .forever
        case .wifi:
            message = "Network reachable through WiFi"
            duration = .long
        case .cellular:
            message = "Network reachable through Mobile data"
            duration = .long
        }
            //
        DispatchQueue.main.async {
            snackbar = TTGSnackbar(message: message,duration: duration)
            snackbar?.backgroundColor = UIColor.blue
            snackbar?.show()
        }
    }
}


