//
//  NetworkWeatherViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

class NetworkWeatherViewController: WeatherTableViewController<NetworkWeatherPresenter> {
    override func getTitle() -> String { return "Network weather" }
}
