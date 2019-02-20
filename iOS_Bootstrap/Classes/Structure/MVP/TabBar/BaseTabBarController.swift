//
//  BaseTabBarController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

import UIKit

// Basic MVP
open class BaseTabBarController <T, V> :
                              UITabBarController,
                              BaseViewDelegator
                              where T : BasePresenter<V> {

    private var presenter : T!
    
    override open func viewDidLoad() {
        self.presenter = T.init(viewDelegator: self as! V)
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
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        getPresenter().viewControllerWillDisappear()
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappearEssentials()
    }
    //
    open func initUI () { fatalError("Must Override") }
    
    open func localizeStrings () { fatalError("Must Override") }
    
    open func initPresenter () { fatalError("Must Override") }
    
    open func loadingDidStarted() { showLoadingIndicator(message: "Loading..") }
    
    open func didFinishedLoading() { hideLoadingIndicator() }
    
    public final func getPresenter() -> T {
        if (presenter == nil) {
            self.presenter = T.init(viewDelegator: self as! V)
        }
        return presenter
    }

    open func showToast(toastMessage: String, duration: Double, position: ToastPosition) {
        self.view.makeToast(toastMessage, duration: duration, position: position)
    }
    
}

