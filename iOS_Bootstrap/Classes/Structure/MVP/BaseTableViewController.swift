//
//  BaseTableViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableViewController <T, V, D> :
                            BaseViewController<T, V>
                            where T : BasePresenter<V> {
    
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    
    //
    public final var getTableViewAdapter : TableviewAdapter { get { return tableViewAdapter } }
    public var getTableViewDataSource : [D] {
        set (dataSource) { return tableViewAdapter.getDataSource = dataSource}
        get { return tableViewAdapter.getDataSource as! [D] }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let tableViewDataSource : [D] = [D]()
        tableViewAdapter.setDataSource(dataSource: tableViewDataSource)
        initTableViewAdapterConfiguraton()
    }
    
    open func initTableViewAdapterConfiguraton() { fatalError("Must Override") }

    public final func initDataSourceIfNeeded(tableViewDataSource : [D]) {
        tableViewAdapter.setDataSource(dataSource: tableViewDataSource)
    }
    
}
