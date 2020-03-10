////
////  GPSWeatherViewController.swift
////  SlideMenuControllerSwift
////
////  Created by Yuji Hato on 1/22/15.
////  Copyright (c) 2015 Yuji Hato. All rights reserved.
////
//
//import UIKit
//
//class GPSWeatherViewController:
//                    WeatherTableViewController<GPSWeatherPresenter,
//                    WeatherViewDelegator> {
//    
//    private var locationManager: LocationManager!
//    
//    override func loadView() {
//        Bundle.main.loadNibNamed("WeatherTableView", owner: self, options: nil)
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        locationManager = LocationManager()
//        locationManager.delegate = self
//        locationManager.requestLocationPermission()
//        locationManager.requestLocationUpdate()
//    }
//
//    override func initUI() {}
//
//    override func localizeStrings() {}
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.tabBarController?.navigationItem.title = "GPS weather"
//        locationManager.getCurrentLocationCoordiantes()
//    }
//    
//}
//
//extension GPSWeatherViewController: LocationManagerDelegate {
//    
//    func didGetLocationCoordinates(lat: Double, longt: Double) {
//        getPresenter().getFiveDaysWeather(lat: lat, longt: longt)
//    }
//    
//    func didFailtToGetLocationCoordinates() {
//        self.view.makeToast("Failed to get current location !", duration: 3.0, position: .center)
//    }
//    
//}
