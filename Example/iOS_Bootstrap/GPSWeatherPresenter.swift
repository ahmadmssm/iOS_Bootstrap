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

    required init(viewDelegator: WeatherViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    func getFiveDaysWeather(lat : Double, longt : Double) {
        repo
            .get5DaysWeatherForcastBy(lat: lat, longt: longt)
            .subscribe(onSuccess: { [weak self] weatherForcast in
                self?
                    .getViewDelegator()
                    .didGetFiveDaysWeather(weatherForcast: weatherForcast)

            }) { [weak self] error in
                self?
                    .getViewDelegator()
                    .didFailToGetFiveDaysWeather(errorMessage: error.localizedDescription)

            }
            .disposed(by: getDisposeBag())
    }
}
