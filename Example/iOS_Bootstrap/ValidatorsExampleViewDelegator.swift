//
//  ValidatorsExampleViewDelegator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

protocol ValidatorsExampleViewDelegator: BaseViewDelegator {
    func onInvalidEmail(errorMessage: String)
    func onInvalidPassword(errorMessage: String)
    func onMisssingValidation()
    func onAllValid()
}
