//
//  MyViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MyViewController: BaseViewController<MyPresenter>, MyProtocol {
    
    var mNavigator : NavigationCoordinator?
    var x : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mNavigator = self.navigator as? NavigationCoordinator
        //
        AppDelegate.setContext(context: self)
        //
        Log.debug(x!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @IBAction func TestButton(_ sender: UIButton) {
        self.presenter.test()
    }
    
    func doNothing() {
        Log.info("I'm here...")
    }

    @IBAction func testNavigator(_ sender: UIButton) {
        self.mNavigator?.startInitialView()
    }
}
