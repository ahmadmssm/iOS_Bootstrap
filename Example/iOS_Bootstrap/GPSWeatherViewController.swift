//
//  GPSWeatherViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/22/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import Resolver

class GPSWeatherViewController: WeatherTableViewController<GPSWeatherPresenter>,
                                LocationManagerDelegate {
    
    @LazyInjected private var locationManager: LocationManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLocationManager()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.locationManager.getCurrentLocationCoordiantes()
    }
    
    override func getTitle() -> String { return "GPS weather" }
    
    func didGetLocationCoordinates(lat: Double, longt: Double) {
        getPresenter().getFiveDaysWeather(lat: lat, longt: longt)
    }
    
    func didFailtToGetLocationCoordinates() {
        showError(errorMessage: "Failed to get current location !")
    }
    
    private func initLocationManager() {
        locationManager.delegate = self
        locationManager.requestLocationPermission()
        locationManager.requestLocationUpdate()
    }
}
