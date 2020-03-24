//
//  WeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Resolver

class WeatherPresenter: AppPresenter<WeatherViewDelegate> {
    
    @LazyInjected var weatherForcastingRepo: WeatherForcastingRepo

    func getFiveDaysWeather(lat: Double, longt: Double) {
        
    }
}
