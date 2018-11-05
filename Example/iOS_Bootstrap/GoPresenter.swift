//
//  GoPresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class GoPresenter : BasePresenter<GoViewDelegator> {
    
    required init(viewDelegator: GoViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        //
        getViewDelegator().loadingDidStarted!()
        APIsConnector.sharedInstance.getDaysWeatherForcastWithNetworkProvidedLocation(forcastDays: 10 ) { response in
            self.getViewDelegator().didFinishedLoading?()
        }
    }
    
}

