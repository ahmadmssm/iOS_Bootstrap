//
//  ReusableTableViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/17/18.
//

import Foundation

open class ReusableTableViewAdapter : NSObject {
    
    private final var mTableview : UITableView!
    private final var tableViewDataSource: [Any]!
    //
    public final var nibClass : BaseTableViewCell.Type!
    private final var mDelegate : TableViewDelegates!
    //
    private final var adapter : TableviewAdapter!
    
    required public init(tableview : UITableView!, tableViewDataSource: [Any]!, delegate : TableViewDelegates) {
        super.init()
        //
        self.mTableview = tableview
        self.tableViewDataSource = tableViewDataSource
        self.mDelegate = delegate
        //
        configureReusableTableView()
        //
        if ((mTableview != nil) &&
            (tableViewDataSource != nil) &&
            (nibClass != nil) &&
            (mDelegate != nil)) {
            adapter = TableviewAdapter()
            adapter?.configureTableWithXibCell(tableView: tableview, dataSource: tableViewDataSource, nibClass: nibClass, delegate: mDelegate!)
        }
    }
    
    public final func reloadTableViewData(dataSource: [Any]!) {
        self.tableViewDataSource = dataSource
        adapter.reloadTable(dataSource: dataSource)
    }
    
    open func configureReusableTableView()  {
        // Set tableview cell here
    }
    
}
