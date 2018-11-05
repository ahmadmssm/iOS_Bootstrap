//
//  TableController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 8/1/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

 class TableController: BaseController<TableExampleView> {
    
    required override init(view: TableExampleView) {
        super.init(view: view)
    }

    func getWorldCountries() {
//        APIsConnector.sharedInstance.getAllCountries (completion: { response in
//            switch response {
//            case .success(let countries):
//                self.getView.didGetCountries(countries: countries)
//                break
//            case .failure(let errorMsg):
//                self.getView.didFailToGetCountries(error: errorMsg)
//                print("Error : " + errorMsg)
//                break
//            }
//        })
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

