//
//  LocationManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import MapKit
import Resolver

class LocationManager {
    
    @LazyInjected private var locationManager: CLLocationManager
    var delegate: LocationManagerDelegate!
    
    final func requestLocationPermission() {
        locationManager.requestAlwaysAuthorization()
    }
    
    final func requestLocationUpdate() { locationManager.startUpdatingLocation() }
    
    final func getCurrentLocationCoordiantes() {
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
