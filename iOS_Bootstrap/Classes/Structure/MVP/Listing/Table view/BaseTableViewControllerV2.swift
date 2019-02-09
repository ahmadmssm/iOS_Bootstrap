//
//  BaseTableViewControllerV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/28/18.
//

open class BaseTableViewControllerV2 <T, V, D, C>: BaseTableViewController<T, V, D>
                                                   where T: BasePresenter<V>,
                                                         C: BaseTableViewCellV2<D> {
    
    public final func initTableViewAdapterConfiguraton(tableView: UITableView,
                                                       delegate: BaseTableViewDelegates) {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: C.self, delegate: delegate)
    }
    
    open func initCell (indexPath: IndexPath) -> C {
        return initCell(cell: C.self, indexPath: indexPath)
    }
    
}
