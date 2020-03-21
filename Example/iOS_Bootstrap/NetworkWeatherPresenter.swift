//
//  NetworkWeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import Resolver

class NetworkWeatherPresenter : BasePresenter<WeatherViewDelegator> {
    
    @LazyInjected private var repo: WeatherForcastingRepo

    required init(viewDelegate: WeatherViewDelegator) {
        super.init(viewDelegate: viewDelegate)
    }
    
    override func viewControllerDidLoad() { getFiveDaysWeather() }
    
    private func getFiveDaysWeather() {
        repo
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

