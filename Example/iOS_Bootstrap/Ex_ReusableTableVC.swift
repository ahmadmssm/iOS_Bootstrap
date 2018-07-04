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
    
    var reusableView : CountriesReusableTable!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        
         tableAdapter.configureTableWithXibCell(tableView: tableview, dataSource: dataSource, nibClass: TableViewCell.self, delegate: self)

        reusableView = CountriesReusableTable(tableview: tableview, tableViewDataSource: dataSource, delegate: self)
                //
//        let refreshControl = UIRefreshControl()
//        tableAdapter.configurePullToRefresh(refreshControl: refreshControl)
        //
        dataSource.removeAll()
        // Mock netwirk delay with 3 seconds
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
               // self.tableAdapter.reloadTable(dataSource: self.dataSource)
                self.reusableView.reloadTableViewData(dataSource: self.dataSource)
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }
    
    func configureNumberOfRowsPerSectionWithSection() {
        
    }
    
    func configureCell(cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell : TableViewCell = tableview.dequeueReusableCell(forIndexPath: indexPath)
        cell.labelCountryName.text = dataSource [indexPath.row].countryName
        cell.labelCapitalName.text = dataSource [indexPath.row].capital
        return cell
    }
    
    func configureNumberOfSections() -> Int {
        return 1
    }
   
    func configureNumberOfRows() -> Int {
        return dataSource.count
    }
    
    func emptyDataSetShouldDisplay() -> Bool {
        return true
    }
    
    func rowDidSelected(indexPath: IndexPath) {
        Log.info("Row no. " + String(indexPath.row))
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

}
