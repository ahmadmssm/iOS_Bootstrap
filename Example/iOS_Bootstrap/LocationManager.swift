//
//  LocationManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MapKit

protocol LocationManagerDelegate {
    func didGetLocationCoordinates(lat : Double, longt : Double)
    func didFailtToGetLocationCoordinates()

}

class LocationManager {
    
    private let locationManager = CLLocationManager()
    var delegate : LocationManagerDelegate!
    
    func requestLocationPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func getCurrentLocationCoordiantes() {
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedWhenInUse ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.authorizedAlways) {
            
            guard let currentLocation = locationManager.location else {
                delegate!.didFailtToGetLocationCoordinates()
                return
            }
            delegate!.didGetLocationCoordinates(lat: currentLocation.coordinate.latitude, longt: currentLocation.coordinate.longitude)
        }
    }

}
