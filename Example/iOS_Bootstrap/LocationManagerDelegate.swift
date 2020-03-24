//
//  LocationManagerDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

protocol LocationManagerDelegate {
    func didGetLocationCoordinates(lat : Double, longt : Double)
    func didFailtToGetLocationCoordinates()
}
