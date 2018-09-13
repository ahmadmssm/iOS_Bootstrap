//
//  HomeVC.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class HomeVC: UIViewController {

    var x : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("X = ", x)
    }

    @IBAction func onToggleButtonClicked(_ sender: ToggleButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        }
//        else {
//            sender.isSelected = true
//        }
    }
}
