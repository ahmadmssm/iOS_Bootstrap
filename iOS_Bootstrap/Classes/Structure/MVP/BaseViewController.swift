//
//  BaseViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class BaseViewController<T, V> :
                            UIViewController, BaseViewDelegator where T : BasePresenter<V> {

    private var presenter: T!
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = T.init(viewDelegator: self as! V)
        getPresenter().viewControllerDidLoaded()
        initUI()
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
        if (presenter != nil) {
            getPresenter().viewControllerWillDisappear()
        }
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappearEssentials()
    }
    
    public final func getPresenter() -> T { return presenter }

    open func initUI () { fatalError("Must Override") }
    
    open func loadingDidStarted() { showLoadingIndicator(message: "Loading..") }
    
    open func didFinishedLoading() { hideLoadingIndicator() }
    
}


