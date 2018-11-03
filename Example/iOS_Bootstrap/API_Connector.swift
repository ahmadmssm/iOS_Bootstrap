
//
//  API_Connector.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class API_Connector : GenericConnector {
    
    private final var apiProvider : APIsProvider<APIs>!
    
    required override init() {
        super.init()
        //
        getUserDefaults().setStringWithKey(value: "22be16bc2f5eecf293aea95be4a83105", key: UserDefaultKeys.tmdbToken)
        //
        GenericErrorConfigurator.defaultErrorHandler(HumanReadableErrorHandler())
        // With plugins
        let networkLogger = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        //
        let plugins : [PluginType] = [networkLogger]
        apiProvider = APIsProvider<APIs>(plugins: plugins)
    }
    
    // Write your network calls here
    func getAllCountries (completion: @escaping completionHandler<[Country]>) {
        subscriber = apiProvider.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
    //        .mapArray(Country.self)
            .subscribe { event in
                switch event {
                case .success(let response):
                    completion(.success(try! response.mapArray(Country.self)))
                case .error(let error):
                    error.localizedDescription
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
    override func getTokenRefreshService() -> Single<Response> {
//               return
//                    apiProvider.rx
//                        .request(.doRequestThatReturnsAnError())
        
//                return
//                    apiProvider.rx
//                        .request(.getWorldCountries())
        
        return
            apiProvider.rx
                .request(.getCountryDetailsByCountryName(countryName: ""))
    }
    
    func getTrendingMovies (pageNo : Int, completion: @escaping completionHandler<MoviesPage>) {
        subscriber = apiProvider.rx
            .request(.getTrendingMovies(page: pageNo))
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self)
            .map(MoviesPage.self)
            .subscribe { event in
                switch event {
                case .success(let moviesPage):
                     completion(.success(moviesPage))
                case .error(let error):
                    print("Error string " + error.localizedDescription)
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
    func getErrorFromRequest (completion: @escaping completionHandler<[Country]>) {
        subscriber = apiProvider.rx
            .request(.doRequestThatReturnsAnError())
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .refreshAuthenticationTokenIfNeeded(sessionServiceDelegate: self, refreshTokenStatusCode: 404)
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let countries : [Country] = Parser.arrayOfObjectsFromJSONstring(object: Country.self, JSONString: responseString)! as! [Country]
                    completion(.success(countries))
                case .error(let error):
                    print("Error string " + error.localizedDescription)
                    completion(.failure(error.localizedDescription))
                }
        }
    }

}
