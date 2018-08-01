//
//
//  MVP_Sample
//  MyViewControllerDelegator.swift
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

public protocol MyViewControllerDelegator : BaseViewDelegator {
    func didGetFakeUsers(page : Page)
    func didFailToGetFakeUsers (error : String)
}

