//
//  Ex_ReusableTableVC.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class Ex_ReusableTableVC: UIViewController {
    
    @IBOutlet weak var tableview: UITableView!
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [Country] = [Country]()
    private var reusableView : CountriesReusableTable!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        reusableView = CountriesReusableTable(tableview: tableview, tableViewDataSource: dataSource)
        //
        // let refreshControl = UIRefreshControl()
        // tableAdapter.configurePullToRefresh(refreshControl: refreshControl)
        //
        dataSource.removeAll()
        // Mock a network delay with 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           // self.getWorldCountries()
            self.getError()
        }
    }
    
    func getWorldCountries() {
        API_Connector().getAllCountries (completion: { response in
            switch response {
            case .success(let countries):
                self.dataSource = countries
                self.reusableView.reloadTableViewData(pageItems: self.dataSource, currentPage: 0)
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }

    func getError () {
        API_Connector().getErrorFromRequest (completion: { response in
            switch response {
            case .success( _):
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }
}
