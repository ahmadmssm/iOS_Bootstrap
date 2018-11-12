//
//  GPSWeatherPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class GPSWeatherPresenter : BasePresenter<WeatherViewDelegator> {
   
    required init(viewDelegator: WeatherViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    func getFiveDaysWeather(lat : Double, longt : Double) {
        getViewDelegator().loadingDidStarted!()
        APIsConnector.sharedInstance.getFiveDaysWeatherForcastWithGPSprovidedLocation(lat: lat, longt: longt) { response in
            self.getViewDelegator().didFinishedLoading?()
            switch response {
            case .success(let weatherFocast):
                self.getViewDelegator().didGetFiveDaysWeather(weatherForcast: weatherFocast)
                break
            case .failure(let errorMessage):
                self.getViewDelegator().didFailToGetFiveDaysWeather(errorMessage: errorMessage)
                break
            }
        }
    }
    
}
