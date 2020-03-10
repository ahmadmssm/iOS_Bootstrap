//
//  GPSWeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import Resolver

class GPSWeatherPresenter : BasePresenter<WeatherViewDelegator> {
   
    @LazyInjected private var repo: Repo

    required init(viewDelegate: WeatherViewDelegator) {
        super.init(viewDelegate: viewDelegate)
    }
    
    func getFiveDaysWeather(lat : Double, longt : Double) {
        repo
            .get5DaysWeatherForcastBy(lat: lat, longt: longt)
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
