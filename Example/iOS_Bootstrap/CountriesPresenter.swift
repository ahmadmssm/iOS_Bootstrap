//
//  CountriesPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CountriesPresenter : BasePresenter<CountriesViewDelegator> {
    
    required init(viewDelegator: CountriesViewDelegator) {
        super.init(viewDelegator: viewDelegator)
    }
    
    func getWorldCountries() {
        APIsConnector.sharedInstance.getAllCountries (completion: { response in
                    switch response {
                    case .success(let countries):
                        self.getViewDelegator().didGetCountries(countries: countries)
                        break
                    case .failure(let errorMsg):
                        self.getViewDelegator().didFailToGetCountries(error: errorMsg)
                        print("Error : " + errorMsg)
                        break
                    }
                })
    }
    
    func getError () {
        //        APIsConnector.sharedInstance.getErrorFromRequest (completion: { response in
        //            switch response {
        //            case .success( _):
        //                break
        //            case .failure(let errorMsg):
        //                print("Error : " + errorMsg)
        //                break
        //            }
        //        })
    }
    
}
