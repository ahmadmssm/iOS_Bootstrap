//
//  Presenter.swift
//  MVP_Sample
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class MyPresenter: BasePresenter<MyViewControllerDelegator> {

    required init(contract: MyViewControllerDelegator) {
        super.init(contract: contract)
    }
    
    func getUsers(pageNumber : Int) {
        API_Connector().getFakeUsers(page: pageNumber, completion: { response in
            switch response {
            case .success(let userPage):
                self.getViewDelegator.didGetFakeUsers(page: userPage)
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                self.getViewDelegator.didFailToGetFakeUsers(error: errorMsg)
                break
            }
        })
    }
    
}
