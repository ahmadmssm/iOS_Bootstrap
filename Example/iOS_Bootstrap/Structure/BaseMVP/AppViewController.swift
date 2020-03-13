//
//  AppViewController.swift
//  iOS_Bootstrap_BaseProject
//
//  Created by Ahmad Mahmoud on 6/20/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import Resolver
import iOS_Bootstrap

class AppViewController<P, V>: BaseViewController<P, V> where P: BasePresenter<V> {
    
    @LazyInjected var navigator: Navigator
    @LazyInjected var dialogs: Dialogs
    private var snackBar: TTGSnackbar?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if (snackBar != nil) {
            snackBar?.dismiss()
            snackBar = nil
        }
        self.snackBar = initSnackbar()
    }
    
    override func initUI() {}
    
    override func localizeStrings() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.updatesStatusBarAppearanceAutomatically = true
    }
    
    final func removeNavigationBarBottomBorder() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    final func restoreNavigationBarBottomBorder() {
        navigationController?.navigationBar.shadowImage = nil
    }
    
    func setNavigationBarTitle(title: String) { self.navigationItem.title = title }
    
    func showToast(toastMessage: String) {
        showToast(toastMessage: toastMessage, duration: 2.0, position: .center)
    }
    
    func initSnackbar() -> TTGSnackbar? {
        let newSnackBar = TTGSnackbar(message: "",duration: .short)
        newSnackBar.backgroundColor = UIColor.beautifulBlueColor
        newSnackBar.actionText = "dismiss".localized()
        newSnackBar.actionBlock = { snackbar in
            snackbar.dismiss()
        }
        return newSnackBar
    }
    
    func networkConnectionMonitoringEnabled() -> Bool { return true }
    
    override func didGetError(errorMessage: String) {
        showError(errorMessage: errorMessage)
    }
    
    override func didGetWarning(warningMessage: String) {
        showWarning(warningMessage: warningMessage)
    }
    
    override func networkStatusDidChange(isConnected: Bool) {
        snackBar?.dismiss()
        if (networkConnectionMonitoringEnabled()) {
            if (!isConnected) {
                snackBar?.duration = .forever
                snackBar?.message = "networkDisConnected".localized()
                snackBar?.backgroundColor = .red
            }
            else {
                snackBar?.duration = .middle
                snackBar?.message =
                    "networkConnected".localized() +
                    " " +
                    getNetworkConnectionType().description
            }
            DispatchQueue.main.async {
                self.snackBar?.show()
            }
        }
    }
    
    override func showLoading() {
        dialogs.showLoading(viewController: self)
    }
    
    override func hideLoading() {
        dialogs.hideDialog()
    }
}
