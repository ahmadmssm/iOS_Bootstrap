//
//  BaseTableViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableViewController <T, V, D> :
                            BaseViewController<T, V>
                            where T: BasePresenter<V> {
    
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    public var isEmptyDataSource : Bool {
        return getTableViewDataSource.count == 0 ? true : false
    }
    //
    
    public final func getTableViewAdapter() -> TableviewAdapter { return tableViewAdapter }
    
    public var getTableViewDataSource: [D] { return tableViewAdapter.getDataSource as! [D] }
    
    public final func setTableViewDataSource(tableViewDataSource: [D])  {
        tableViewAdapter.setDataSource(dataSource: tableViewDataSource)
    }
    
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
    
    public final func initCell <C: BaseTableViewCellV2<D>>(cell: C.Type, indexPath: IndexPath) -> C {
        let cell: C = getTableViewAdapter().getTableView().dequeueReusableCell(forIndexPath: indexPath)
        if (getCellModel(indexPath: indexPath) != nil) {
            cell.mCellModel = getCellModel(indexPath: indexPath)
        }
        return cell
    }
    
    private final func getCellModel(indexPath: IndexPath) -> D? {
        if let cellModel = getTableViewDataSource[exist: indexPath.row] { return cellModel }
        return nil
    }
    
}
