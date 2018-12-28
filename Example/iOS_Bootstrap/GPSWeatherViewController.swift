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
    
    private var locationManager: LocationManager!
    
    override func loadView() {
        Bundle.main.loadNibNamed("WeatherTableView", owner: self, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = LocationManager()
        locationManager.delegate = self
        locationManager.requestLocationPermission()
    }

    override func initUI() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "GPS weather"
        locationManager.getCurrentLocationCoordiantes()
    }
    
}

extension GPSWeatherViewController: LocationManagerDelegate {
    
    func didGetLocationCoordinates(lat: Double, longt: Double) {
        getPresenter().getFiveDaysWeather(lat: lat, longt: longt)
    }
    
    func didFailtToGetLocationCoordinates() {
        locationManager.getCurrentLocationCoordiantes()
    }
    
}
