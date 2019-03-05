//
//  NetworkWeatherViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class NetworkWeatherViewController:
                WeatherTableViewController<NetworkWeatherPresenter, WeatherViewDelegator> {
    
    override func loadView() {
        Bundle.main.loadNibNamed("WeatherTableView", owner: self, options: nil)
    }
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {}
    
    override func localizeStrings() {}
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Network weather"
    }
        
}
