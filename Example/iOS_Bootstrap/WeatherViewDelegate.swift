//
//  WeatherViewDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

protocol WeatherViewDelegate: AppViewDelegate {
    func didGetFiveDaysWeather(weatherForcast: WeatherForcast)
    func didFailToGetFiveDaysWeather(errorMessage: String)
}
