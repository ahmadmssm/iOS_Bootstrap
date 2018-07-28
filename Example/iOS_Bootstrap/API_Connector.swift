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

    fileprivate final var apiProvider : APIsProvider<APIs>!
    
    required override init() {
        super.init()
        GenericErrorConfigurator.defaultErrorHandler(HumanReadableError())
        // With plugins
        //
        // let networkLogger = NetworkLoggerPlugin(verbose: true)
        // With formatted output
        let networkLogger = NetworkLoggerPlugin(verbose: true, responseDataFormatter: JSONResponseDataFormatter)
        //
        let plugins : [PluginType] = [networkLogger]
        apiProvider = APIsProvider<APIs>(plugins: plugins)
        // Without plugins
       // apiProvider = APIsProvider<APIs>()
    }
    
    
    func getAllCountries (completion: @escaping completionHandler<[Country]>) {
        let _ = apiProvider.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .asObservable()
            .retryWithAuthIfNeeded(sessionServiceDelegate: self)
            .asSingle()
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let countries : [Country] = Parser.arrayOfObjectsFromJSONstring(object: Country.self, JSONString: responseString)! as! [Country]
                    completion(.success(countries))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }}
    }
    
    override func getRefreshTokenObservable() -> Observable<Response> {
        return
            apiProvider.rx
                .request(.doRequestThatReturnsAnError())
                .asObservable()
//        return
//            apiProvider.rx
//                .request(.getWorldCountries())
//                .asObservable()
    }
    

    func getFakeUsers (page : Int, completion: @escaping completionHandler<Page>) {
        let _ = apiProvider.rx
            .request(.getUsers(page: String(page)))
            .filterSuccessfulStatusAndRedirectCodes()
            .asObservable()
            .retryWithAuthIfNeeded(sessionServiceDelegate: self)
            .asSingle()
            .map(Page.self)
            .subscribe { event in
                switch event {
                    case .success(let page) :
                        completion(.success(page))
                    case .error(let error):
                        completion(.failure(error.localizedDescription))
                }
            }
            .disposed(by: self.disposeBag)
    }
    
    func getErrorFromRequest (completion: @escaping completionHandler<[Country]>) {
        let _ =
        apiProvider
            .rx
            .request(.doRequestThatReturnsAnError())
            .filterSuccessfulStatusAndRedirectCodesAndProcessErrors()
            .asObservable()
            .retryWithAuthIfNeeded(sessionServiceDelegate: self)
            .asSingle()
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let countries : [Country] = Parser.arrayOfObjectsFromJSONstring(object: Country.self, JSONString: responseString)! as! [Country]
                    completion(.success(countries))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }
        }
    }
    
}

