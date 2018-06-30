//
//  Presenter.swift
//  MVP_Sample
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation
import iOS_Bootstrap

class MyPresenter: BasePresenter {
    
    private var delegator : MyProtocol!
    //
    required public init<T>(contract: T!) where T : BaseContractProtocol {
        super.init(contract: contract)
        //
        delegator = self.viewDelegator as? MyProtocol
    }
    
    func test() {
        delegator.doNothing()
    }
}
