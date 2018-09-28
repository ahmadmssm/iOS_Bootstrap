//
//  BaseTableView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableView<D>: BaseView {
    //
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    public final var getTableViewAdapter : TableviewAdapter { get { return tableViewAdapter } }
    public var getTableViewDataSource : [D] {
        set (dataSource) { return tableViewAdapter.getDataSource = dataSource}
        get { return tableViewAdapter.getDataSource as! [D] }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        initTableViewAdapterConfiguraton()
        let tableViewDataSource : [D] = [D]()
        tableViewAdapter.setDataSource(dataSource: tableViewDataSource)
    }
    
    open func initTableViewAdapterConfiguraton() { fatalError("Must Override") }
    open func initPaginationParameters() {}
    open func didGetTableViewItems(forPage page: Int, updatedDataSource: [D]) {
        initPaginationParameters()
    }
}

