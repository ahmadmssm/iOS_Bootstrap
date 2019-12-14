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
    
    @LazyInjected private var repo: Repo

    required init(viewDelegator: WeatherViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    override func viewControllerDidLoaded() { getFiveDaysWeather() }
    
    private func getFiveDaysWeather() {
        repo
            .getFiveDaysWeatherForcastWithNetworkProvidedLocation()
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

