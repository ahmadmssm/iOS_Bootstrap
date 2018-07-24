//
//
//  MVP_Sample
//  MyViewControllerDelegator.swift
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

@objc public protocol MyViewControllerDelegator : BaseViewDelegator {
    func doNothing()
    @objc optional func doThing ()
}

