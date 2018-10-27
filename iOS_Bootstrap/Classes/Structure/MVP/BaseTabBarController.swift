//
//  BaseTabBarController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/27/18.
//

import UIKit

open class BaseTabBarController <T, V> : UITabBarController where T : BasePresenter<V> {

    private var presenter : T!
    
    override open func viewDidLoad() {
        self.presenter = T.init()
        initUI()
    }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewWillAppearEssentials()
    }
    //
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        setupViewDidDisappearEssentials()
        setupViewDidDisappearEssentials()
    }
        
    public final var getPresenter : T {
        get {
            if (presenter.getViewDelegator == nil) {
                presenter.attachView(contract: self as! V)
            }
            return presenter
        }
    }
    
    open func initUI () { fatalError("Must Override") }

}



