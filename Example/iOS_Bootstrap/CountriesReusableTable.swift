//
//  CountriesReusableTable.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/17/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class CountriesReusableTable: ReusableTableViewAdapter {
    
    private var countries : [Country]?
    
    override func configureReusableTableView(tableViewDataSource: [Any]!) {
        self.nibClass = TableViewCell.self
        self.countries = tableViewDataSource as? [Country]
    }
    
    override func reloadTableViewData(pageItems: [Any]!, currentPage: Int) {
        super.reloadTableViewData(pageItems: pageItems, currentPage: currentPage)
        self.countries = pageItems as? [Country]
    }
    
    override func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : TableViewCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.labelCountryName.text = countries! [indexPath.row].countryName
        cell.labelCapitalName.text = countries! [indexPath.row].capital
        return cell
    }

    // Optional callbacks
    func emptyDataSetShouldDisplay() -> Bool {
        return true
    }
    
    func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.blue,
            NSAttributedStringKey.strokeWidth : -2.0,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }
    
    func rowDidSelected(indexPath: IndexPath) {
        Log.info("Row no. " + String(indexPath.row))
    }
}
