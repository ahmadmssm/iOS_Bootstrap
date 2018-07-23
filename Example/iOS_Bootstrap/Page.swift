//
//  Page.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// https://reqres.in/api/users?page=3

import iOS_Bootstrap

struct Page : BaseModel {
    var page : Int?
    var per_page : Int?
    var total : Int?
    var total_pages : Int?
    var data : [User]?
}
