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
    public var isEmptyDataSource : Bool = false
    
    public final func getTableViewAdapter() -> TableviewAdapter {
        return tableViewAdapter
    }
    
//    public final func getTableViewDataSource() -> [D] {
//        return tableViewAdapter.getDataSource as! [D]
//    }
    
    public var getTableViewDataSource : [D] {
        get { return tableViewAdapter.getDataSource as! [D] }
    }
    
    public final func setTableViewDataSource(tableViewDataSource : [D])  { tableViewAdapter.setDataSource(dataSource: tableViewDataSource) }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let tableViewDataSource : [D] = [D]()
        tableViewAdapter.setDataSource(dataSource: tableViewDataSource)
        initTableViewAdapterConfiguraton()
    }
    
    open func initTableViewAdapterConfiguraton() { fatalError("Must Override") }

    public final func initDataSourceIfNeeded(tableViewDataSource : [D]) {
        setTableViewDataSource(tableViewDataSource: tableViewDataSource)
    }
    
}
