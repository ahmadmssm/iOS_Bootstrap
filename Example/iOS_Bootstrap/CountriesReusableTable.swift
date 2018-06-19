//
//  CountriesReusableTable.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/17/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CountriesReusableTable: ReusableTableViewAdapter {
    
    override func configureReusableTableView() {
        self.nibClass = TableViewCell.self
    }
}
