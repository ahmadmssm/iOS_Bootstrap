//
//  TableviewAdapter.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation
import UIKit


class TableviewAdapter : NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private var mTableview : UITableView?
    private var tableViewDataSource: [Any]?
    private var mNibClass : BaseTableViewCell.Type?
    private var mDelegate : TableViewDelegates?

    func configureTableWithXibCell (tableView: UITableView,
                                    dataSource: [Any],
                                    nibClass : BaseTableViewCell.Type,
                                    delegate : TableViewDelegates) {
        self.tableViewDataSource = dataSource
        self.mTableview = tableView
        self.mDelegate = delegate
        self.mNibClass = nibClass
        //
        self.mTableview?.register(HopaTableViewCell.self)
        mTableview?.dataSource = self
        mTableview?.delegate = self
        //
        mDelegate?.configureAdditionalTableProperties?(table: mTableview!)
        configurePullToRefresh()
    }
    
    // Pull to refresh configuration
    private func configurePullToRefresh() {
        let refreshControl = UIRefreshControl()
        mDelegate?.configurePullToRefresh?(refreshcontrole: refreshControl)
        refreshControl.addTarget(self, action:
            #selector(self.pullToRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        mTableview?.addSubview(refreshControl)
    }
    // Pull to refresh action
    @objc private func pullToRefresh (_ refreshControl: UIRefreshControl) {
        mDelegate?.pullToRefresh?(refreshcontrole: refreshControl)
    }
    
    func reloadTable(dataSourcee: [Any]) {
        self.tableViewDataSource = dataSourcee
        mTableview?.reloadData()
    }
    // Table view callbacks
    //
    // Configure number of rows/sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mDelegate?.configureNumberOfRowsPerSection(section: section)) != nil {
            return (mDelegate?.configureNumberOfRowsPerSection(section: section))!
        }
        else if (tableViewDataSource != nil && (tableViewDataSource?.count)! > 0) {
            return (tableViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    func numberOfSections(in tableView: UITableView) -> Int {
        return (mDelegate?.configureNumberOfSections?()) ?? 1
    }
    // Configure cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (mDelegate?.configureCell(cellForRowAt: indexPath))!
    }
    // cell did selected at index
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mDelegate?.rowDidSelected?(atIndexPath: indexPath)
    }
    
    // Pagination
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        mDelegate?.loadMore?(indexPath: indexPath)
    }
}

//extension TableviewAdapter : DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
//    //
//    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
//        return (mDelegate?.emptyDataSetShouldDisplay!())!
//    }
//}


@objc protocol TableViewDelegates {
    func configureCell (cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func configureNumberOfRowsPerSection(section : Int) -> Int
    @objc optional func configureNumberOfSections() -> Int
    @objc optional func rowDidSelected(atIndexPath : IndexPath)
    @objc optional func loadMore (indexPath: IndexPath)
    @objc optional func configurePullToRefresh (refreshcontrole : UIRefreshControl)
    @objc optional func pullToRefresh (refreshcontrole : UIRefreshControl)
    @objc optional func configureAdditionalTableProperties (table : UITableView)
    // Emty DZNemptyDataset callbacks
    @objc optional func emptyDataSetShouldDisplay () -> Bool

    
}

