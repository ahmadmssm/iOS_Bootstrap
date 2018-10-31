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
        self.presenter = T.init(viewDelegator: self as! V)
        getPresenter().viewControllerDidLoaded()
        initUI()
        getPresenter().viewControllerDidFinishedSettingUpUI()    }
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
        InternetConnectionManager.getInstance.removeListener(listener: self)
        setupViewDidDisappearEssentials()
    }
    
    public final func getPresenter() -> T { return presenter }
    
    open func initUI () { fatalError("Must Override") }

}



