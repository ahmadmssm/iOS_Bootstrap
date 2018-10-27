//
//  BaseView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

import UIKit


open class BaseView : UIViewController {

    open func getController<C>() -> C? {
        return nil
    }
    
    override open func viewDidLoad() {
        initController()
        initUI()
    }
    //
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupViewWillAppearEssentials()
    }
    
    override open func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        InternetConnectionManager.getInstance.removeListener(listener: self)
        setupViewDidDisappearEssentials()
    }
   
    open func initUI () { fatalError("Must Override") }

    open func initController () { fatalError("Must Override") }

}
