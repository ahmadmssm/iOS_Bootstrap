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
    
    
    func configureCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CustomCell = tableview.dequeueReusableCell(forIndexPath: indexPath) as CustomCell
        
        cell.labelCountryName.text = "Egypt"
       // cell.labelCountryCapital.text = dataSource [indexPath.row]
        return cell
    }
    
    func configureNumberOfRowsPerSection(section: Int) -> Int {
        return dataSource.count
    }
    
    
    @IBOutlet weak var tableview: UITableView!
    
    private var tableAdapter : TableviewAdapter?
    private var dataSource : [String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        dataSource = ["1", "2", "3", "4", "5"]
        //
        tableAdapter = TableviewAdapter()
        tableAdapter?.configureTableWithXibCell(tableView: tableview, dataSource: dataSource, nibClass: CustomCell.self, delegate: self)
        tableAdapter?.reloadTable(dataSourcee: dataSource)
    }
    
   


}
