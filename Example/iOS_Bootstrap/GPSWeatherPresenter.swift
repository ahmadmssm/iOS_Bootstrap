//
//  GPSWeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class GPSWeatherPresenter : BasePresenter<GPSWeatherViewDelegator> {
   
    required init(viewDelegator: GPSWeatherViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    override func viewControllerDidLoaded() { getTenDaysWeather() }
    
    private func getTenDaysWeather() {
        getViewDelegator().loadingDidStarted!()
        APIsConnector.sharedInstance.getFiveDaysWeatherForcastWithNetworkProvidedLocation() { response in
            self.getViewDelegator().didFinishedLoading?()
            switch response {
            case .success(let weatherFocast):
                self.getViewDelegator().didGetTenDaysWeather(weatherForcast: weatherFocast)
                break
            case .failure(let errorMessage):
                self.getViewDelegator().didFailToGetTenDaysWeather(errorMessage: errorMessage)
                break
            }
        }
    }
    
}
