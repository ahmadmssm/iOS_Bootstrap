//
//  WeatherPagerController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

class WeatherPagerController: DTPagerController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "5 days weather forcast"
        // Setup view pager
        let networkWeather = NetworkWeatherViewController()
        networkWeather.title = "Network weather"
        let gpsWeather = GPSWeatherViewController()
        gpsWeather.title = "GPS weather"
        viewControllers = [networkWeather, gpsWeather]
    }
}
