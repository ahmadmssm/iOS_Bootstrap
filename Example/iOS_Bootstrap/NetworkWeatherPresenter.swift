//
//  NetworkWeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import Resolver

class NetworkWeatherPresenter: WeatherPresenter {
    
    override func viewControllerDidLoad() { getFiveDaysWeather() }
    
    override func getFiveDaysWeather(lat: Double = 0, longt: Double = 0) {
        weatherForcastingRepo
            .getFiveDaysWeatherForcastWithNetworkProvidedLocation()
            .subscribe(onSuccess: { [weak self] weatherForcast in
                self?
                    .getViewDelegate()
                    .didGetFiveDaysWeather(weatherForcast: weatherForcast)
            }) { [weak self] error in
                self?
                    .getViewDelegate()
                    .didFailToGetFiveDaysWeather(errorMessage: error.localizedDescription)
            }
            .disposed(by: disposeBag)
    }
}

