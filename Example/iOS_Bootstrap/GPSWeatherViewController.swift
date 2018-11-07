//
//  GPSWeatherViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit

class GPSWeatherViewController:
                    WeatherTableViewController<GPSWeatherPresenter, WeatherViewDelegator> {
    
    @IBOutlet weak var tableView: UITableView!
    let location = LocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        location.delegate = self
        location.requestLocationPermission()
    }

    override func initUI() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "GPS weather"
        location.getCurrentLocationCoordiantes()
    }

    override func getTableView() -> UITableView { return tableView }

    override func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return super.configureTableViewCell(tableView: tableView, cellForRowAt: indexPath)
    }
    
}

extension GPSWeatherViewController: LocationManagerDelegate {
    
    func didGetLocationCoordinates(lat: Double, longt: Double) {
        getPresenter().getFiveDaysWeather(lat: lat, longt: longt)
    }
    
    func didFailtToGetLocationCoordinates() {
        location.getCurrentLocationCoordiantes()
    }
    
}
