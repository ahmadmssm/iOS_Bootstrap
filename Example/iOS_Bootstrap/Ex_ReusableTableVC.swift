//
//  Ex_ReusableTableVC.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class Ex_ReusableTableVC: UIViewController, TableViewDelegates {
    
    @IBOutlet weak var tableview: UITableView!
    
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        dataSource = ["1", "2", "3", "4", "5"]
        //
        tableAdapter.configureTableWithXibCell(tableView: tableview, dataSource: dataSource, nibClass: TableViewCell.self, delegate: self)
        tableAdapter.reloadTable(dataSourcee: dataSource)
    }
    
    func configureCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : TableViewCell = tableview.dequeueReusableCell(forIndexPath: indexPath)
        cell.labelCountryName.text = "Egypt"
        cell.labelCountryCode.text = dataSource [indexPath.row]
        return cell
    }
    
    func configureNumberOfRowsPerSection(section: Int) -> Int {
        return dataSource.count
    }
   
    func configureNumberOfRows() -> Int {
        return dataSource.count
    }


}
