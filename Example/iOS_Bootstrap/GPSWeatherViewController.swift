//
//  GPSWeatherViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class GPSWeatherViewController: MyMenuItemViewController<GPSWeatherPresenter, GPSWeatherViewDelegator>, GPSWeatherViewDelegator {
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func initUI() {}
    
}
