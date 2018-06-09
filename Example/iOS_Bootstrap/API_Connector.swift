//
//  API_Connector.swift
//  NetworkAbstractLayer_sample
//
//  Created by Ahmad Mahmoud on 4/7/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class API_Connector : NSObject {

    private let apiProvide : MoyaSugarProvider<API>
    
    required override init() {
        GenericErrorConfiguration.setDefaultErrorHandler(HumanReadableError())
        apiProvide = MoyaSugarProvider<API>()
    }
    
    
    func getAllCountries (completion: @escaping (ConnectionResult) -> ()) {
        let _ = apiProvide.rx
            .request(.getWorldCountries())
            .filterSuccessfulStatusCodes()
            .processErrors()
            .mapString()
            .subscribe { event in
                switch event {
                case .success(let responseString):
                    let countries : [Country] = Parser.arrayOfObjectsFromJSONstring(object: Country.self, JSONString: responseString)! as! [Country]
                    completion(.success(countries as AnyObject))
                case .error(let error):
                    completion(.failure(error.localizedDescription))
                }}
    }
}



