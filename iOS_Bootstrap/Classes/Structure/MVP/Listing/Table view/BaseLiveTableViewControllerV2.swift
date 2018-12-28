//
//  BaseLiveTableViewControllerV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/28/18.
//

open class BaseLiveTableViewControllerV2 <T, V, D, C>: BaseLiveTableViewController<T, V, D>
where T: BaseLiveListingPresenter<V, D>, C: BaseTableViewCellV2<D> {
    
    public final func initTableViewAdapterConfiguraton(tableView: UITableView,
                                                       delegate: BaseTableViewDelegates) {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: C.self, delegate: delegate)
    }
    
    public final func initCell (indexPath: IndexPath) -> C {
        return initCell(cell: C.self, indexPath: indexPath)
    }
    
}
