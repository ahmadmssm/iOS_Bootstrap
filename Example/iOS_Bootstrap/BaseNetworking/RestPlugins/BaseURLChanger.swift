//
//  BaseURLChanger.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/23/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class BaseURLChanger: RequestIntercepterProtocol {
    
    func getUpdatedURLRequest(_ urlRequest: URLRequest, for session: Session) -> URLRequest {
        let url = urlRequest.url
        var request = urlRequest
        if let urlString = url?.absoluteString {
            var baseURL: String
            if (urlString.contains(Endpoints.trendingMovies)) {
                baseURL = "https://api.themoviedb.org/3/"
            }
            else if (urlString.contains(Endpoints.worldCountries)) {
                baseURL = "https://restcountries.eu/rest/v2/"
            }
            else if (urlString.contains(Endpoints.fiveDaysWeatherForcast)) {
                baseURL = "http://api.openweathermap.org/data/2.5/"
            }
            else if (urlString.contains(Endpoints.devicePublicIP)) {
                baseURL = "https://api.ipify.org/"
            }
            else if (urlString.contains(Endpoints.locationCoordinates)) {
                baseURL = "http://api.ipstack.com"
            }
            else if (urlString.contains(Endpoints.refreshToken)) {
                baseURL = ""
            }
            else {
                baseURL = (url?.baseURL!.absoluteString)!
            }
            request.url = getUpdatedBaseURK(newBaseURL: baseURL, url: url!)
        }
        return request
    }
    
    private func getUpdatedBaseURK(newBaseURL: String, url: URL) -> URL {
        return (newBaseURL + url.absoluteString).toURL()
    }
}


