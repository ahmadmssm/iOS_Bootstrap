//
//  MVC_ViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/23/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MVC_ViewController : BaseView {
    
    private var controller : MyController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        controller = MyController(view: self)
    }
    
    func changeStatus() {
        
    }
    
 }

