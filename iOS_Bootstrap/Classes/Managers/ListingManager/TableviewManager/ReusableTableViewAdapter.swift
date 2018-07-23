//
//  ReusableTableViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/17/18.
//

open class ReusableTableViewAdapter : NSObject, TableViewDelegates {
    
    private final var tableview : UITableView!
    private final var tableViewDataSource: [Any]!
    //
    public final var nibClass : BaseTableViewCell.Type!
    private final var mDelegate : TableViewDelegates!
    //
    private final var adapter : TableviewAdapter!
    
    required public init(tableview : UITableView!, tableViewDataSource: [Any]!) {
        super.init()
        //
        self.tableview = tableview
        self.tableViewDataSource = tableViewDataSource
        self.mDelegate = self
        //
        configureReusableTableView(tableViewDataSource: tableViewDataSource)
        //
        if ((tableview != nil) &&
            (tableViewDataSource != nil) &&
            (nibClass != nil) &&
            (mDelegate != nil)) {
            adapter = TableviewAdapter()
            adapter?.configureTableWithXibCell(tableView: tableview, dataSource: tableViewDataSource, nibClass: nibClass, delegate: mDelegate!)
        }
    }
    
    open func configureCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : BaseTableViewCell = tableview.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
    public final func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        adapter.configurePaginationParameters(totalNumberOfItems: totalNumberOfItems, itemsPerPage: itemsPerPage)
    }
    
    open func reloadTableViewData(pageItems: [Any]!, currentPage: Int) {
       // adapter.reloadTable(pageItems: pageItems, currentPage: currentPage)
        adapter.reloadTable(pageItems: pageItems)
    }
    
    open func configureReusableTableView(tableViewDataSource: [Any]!) {}
    

}
