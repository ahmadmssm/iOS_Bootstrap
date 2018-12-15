//
//  Section.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/17/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

struct Section : Decodable {
    var name: String!
    var items: [String]!
    var collapsed: Bool!
    
    init(name: String, items: [String], collapsed: Bool = false) {
        self.name = name
        self.items = items
        self.collapsed = false
    }
}
