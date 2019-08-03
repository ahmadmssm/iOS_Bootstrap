//
//  BaseViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class BaseViewController<T, V> :
                            UIViewController, BaseViewDelegator where T: BasePresenter<V> {

    private var presenter: T!
    //
    open var isPresented: Bool {
        return presentingViewController != nil ||
            navigationController?
                .presentingViewController?
                .presentedViewController === navigationController ||
            tabBarController?.presentingViewController is UITabBarController
    }
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        // self.presenter = T.init(viewDelegator: self as! V)
        self.presenter = initPresenter()
        getPresenter().viewControllerDidLoaded()
        initUI()
        localizeStrings()
        getPresenter().viewControllerDidFinishedSettingUpUI()
    }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewWillAppearEssentials()
        getPresenter().viewControllerWillRefresh()
    }
    //
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPresenter().viewControllerDidAppear()
    }
    //
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if (presenter != nil) {
            getPresenter().viewControllerWillDisappear()
        }
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappearEssentials()
    }
    
    public final func getPresenter() -> T {
        if (presenter == nil) {
            self.presenter = T.init(viewDelegator: self as! V)
        }
        return presenter
    }

    open func initUI () { fatalError("Must Override") }
    
    open func localizeStrings () { fatalError("Must Override") }

    open func initPresenter () -> T? { return nil }

    open func loadingDidStarted() { showLoadingIndicator(message: "Loading..") }
    
    open func didFinishedLoading() { hideLoadingIndicator() }
    
    open func didGetWarning(warningMessage: String) {}
    
    open func didGetError(errorMessage: String) {}
    
    open func showToast(toastMessage: String, duration: Double, position: ToastPosition) {
        self.view.makeToast(toastMessage, duration: duration, position: position)
    }
    
    open func dismiss(withAnimation animated: Bool? = true,
                      completion: (() -> Void)? = nil) {
        if (isPresented) {
            dismiss(animated: animated!, completion: completion ?? nil)
        }
        else {
            navigationController?.popViewController(animated: animated!)
        }
    }
}


