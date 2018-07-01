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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func TestButton(_ sender: UIButton) {
        self.presenter.test()
    }
    
    func doNothing() {
        Log.info("I'm here...")
    }
}
