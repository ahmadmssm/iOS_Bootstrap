//
//  Ex_ReusableTableVC.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/8/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class Ex_ReusableTableVC: BaseView {
    
    @IBOutlet weak var tableview: UITableView!
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [Country] = [Country]()
    private var reusableView : CountriesReusableTable!
    //
    private var controller : Ex_ReusableTableController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        initUI()
        controller = Ex_ReusableTableController(view: self)
        //
       
        // Mock a network delay with 3 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
           // self.getWorldCountries()
            self.controller.getError()
        }
    }
    
    private func initUI() {
        //
        reusableView = CountriesReusableTable(tableview: tableview, tableViewDataSource: dataSource)
        //
        // let refreshControl = UIRefreshControl()
        // tableAdapter.configurePullToRefresh(refreshControl: refreshControl)
        //
        dataSource.removeAll()
    }
    
    func didGetCountries(countries : [Country]) {
        self.dataSource = countries
        self.reusableView.reloadTableViewData(pageItems: self.dataSource, currentPage: 0)
    }
    
    func didFailToGetCountries(error : String) {
        // Do any thing with your error
        Log.error("Error " + error)
    }
    
    
}
