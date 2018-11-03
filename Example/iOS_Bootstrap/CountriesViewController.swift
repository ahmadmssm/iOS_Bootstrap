//
//  CountriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class CountriesViewController: MyMenuItemViewController<CountriesPresenter, CountriesViewDelegator>, CountriesViewDelegator {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initUI() { self.title = "World countries" }
    
}
