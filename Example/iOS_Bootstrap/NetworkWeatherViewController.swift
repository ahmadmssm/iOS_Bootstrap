//
//  NetworkWeatherViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class NetworkWeatherViewController:
            WeatherTableViewController<NetworkWeatherPresenter, NetworkWeatherViewDelegator>,
            NetworkWeatherViewDelegator {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Network weather"
    }
    
    override func getTableView() -> UITableView { return tableView }
    
    override func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return super.configureCellForRow(tableView: tableView, cellForRowAt: indexPath)
    }
    
}


