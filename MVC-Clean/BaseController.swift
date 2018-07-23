//
//  BaseController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/23/18.
//

open class BaseController {
   // public let viewDelegator : BaseContractProtocol
    required public init <T : BaseContractProtocol> (contract : T) {
         //self.viewDelegator = contract
        
    }
}

