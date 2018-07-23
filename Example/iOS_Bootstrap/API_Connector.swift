//
//  API_Connector.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class API_Connector : GenericConnector {

    private let apiProvide : APIsProvider<APIs>!
    
    required override init() {
        GenericErrorConfigurator.defaultErrorHandler(HumanReadableError())
        apiProvide = APIsProvider<APIs>()
    }
    
    func getAllCountries (completion: @escaping completionHandler<[Country]>) {
        let _ = apiProvide.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusCodes()
            .processErrors()
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

    func getFakeUsers (page : Int, completion: @escaping completionHandler<Page>) {
        let _ = apiProvide.rx
            .request(.getUsers(page: String(page)))
            .filterSuccessfulStatusCodes()
            .processErrors()
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let users : Page = Parser.objectFromJSONstring(object: Page.self, JSONString: responseString)!
                    completion(.success(users))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }}
    }
    
}



