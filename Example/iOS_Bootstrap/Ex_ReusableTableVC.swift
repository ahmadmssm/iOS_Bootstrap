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
    private var dataSource : [Country] = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        tableAdapter.configureTableWithXibCell(tableView: tableview, dataSource: dataSource, nibClass: TableViewCell.self, delegate: self)
        //
//        let refreshControl = UIRefreshControl()
//        tableAdapter.configurePullToRefresh(refreshControl: refreshControl)
        //
        dataSource.removeAll()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.getWorldCountries()
        }
    }
    
    func getWorldCountries() {
        API_Connector().getAllCountries (completion: { response in
            switch response {
            case .success(let countries):
                let countriesArr : [Country] = (countries as! [Country])
                print("Country title : ", countriesArr[0].capital!)
                self.dataSource = countriesArr
                self.tableAdapter.reloadTable(dataSourcee: self.dataSource)
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }
    
    func configureCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : TableViewCell = tableview.dequeueReusableCell(forIndexPath: indexPath)
        cell.labelCountryName.text = dataSource [indexPath.row].nativeName
        cell.labelCapitalName.text = dataSource [indexPath.row].capital
        return cell
    }
    
//    func configureNumberOfRowsPerSection(section: Int) -> Int {
//        return dataSource.count
//    }
   
    func configureNumberOfRows() -> Int {
        return dataSource.count
    }
    
    func emptyDataSetShouldDisplay() -> Bool {
        return true
    }
    
    func rowDidSelected(indexPath: IndexPath) {
        Log.info("Row no. " + String(indexPath.row))
    }
    
//    func emptyDataSetDescriptionText() -> NSAttributedString {
//        let attributes: [String:AnyObject] = [NSForegroundColorAttributeName : UIColor.blue]
//        return NSAttributedString(string: "No data !", attributes: attributes)
//    }

}
