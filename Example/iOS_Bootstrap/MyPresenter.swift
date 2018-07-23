//
//  Presenter.swift
//  MVP_Sample
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation
import iOS_Bootstrap

class MyPresenter: BasePresenter<MyProtocol> {

    required init(contract: MyProtocol) {
        super.init(contract: contract)
    }
   
    func test() {
        self.viewDelegator?.doNothing()
    }
}
