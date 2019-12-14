//
//  FiveDaysWeatherForcastAPI.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/9/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class FiveDaysWeatherForcastAPI: AppAPI<WeatherForcast> {
    
    private let lat: Double
    private let longt: Double

    override var baseURL: URL {
        return "http://api.openweathermap.org/data/2.5".toURL()
    }
    override var route: Route { return .get("/forecast") }
    override var parameters: Parameters? {
        return URLEncoding() => [
            "lat" : lat,
            "lon" : longt,
            "units" : "metric",
            "APPID" : Constants.openApiAuthKey
        ]
    }
    
    init(lat: Double, longt: Double) {
        self.lat = lat
        self.longt = longt
    }
}
