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
    
    override func viewControllerDidLoaded() { getWorldCountries() }
    
    func getWorldCountries() {
        getViewDelegator().loadingDidStarted!()
        APIsConnector.sharedInstance.getAllCountries (completion: { response in
            self.getViewDelegator().didFinishedLoading!()
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
    
}
