//
//  WeatherViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol WeatherViewDelegator : BaseViewDelegator {
    func didGetFiveDaysWeather(weatherForcast : WeatherForcast)
    func didFailToGetFiveDaysWeather(errorMessage : String)
}
