//
//  HomeVC.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/9/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

protocol HomeViewDelegator : BaseViewDelegator {
    
}

class HomePresenter: BasePresenter<HomeViewDelegator> {
    
}

class HomeVC: BaseViewController<HomePresenter, HomeViewDelegator> {

    var x : Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("X = ", x)
    }
    
    override func awakeFromNib() {
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Home") {
           // self.mainViewController = controller
        }
//        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "Left") {
//            self.leftViewController = controller
//        }
        super.awakeFromNib()
    }

    override func initUI() {}
    
    @IBAction func onToggleButtonClicked(_ sender: ToggleButton) {
//        if sender.isSelected {
//            sender.isSelected = false
//        }
//        else {
//            sender.isSelected = true
//        }
    }
}
