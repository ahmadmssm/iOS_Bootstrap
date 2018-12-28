//
//  BaseSideMenuTableViewControllerV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/28/18.
//

open class BaseSideMenuTableViewControllerV2<T, V, M, C>:
                                            BaseSideMenuTableViewController<T, V, M>
                                            where
                                            T: BasePresenter<V>,
                                            M: BaseSideMenuModel,
                                            C: BaseTableViewCellV2<M> {
    
    public final override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: setupSideMenuTableView(), nibClass: C.self, delegate: self)
        getTableViewAdapter().configurePaginationParameters(totalNumberOfItems: (menuItems?.count)!, itemsPerPage: (menuItems?.count)!)
        initDataSourceIfNeeded(tableViewDataSource: setupMenuItemsData())
    }
    
    public final func initCell (indexPath: IndexPath) -> C {
        return initCell(cell: C.self, indexPath: indexPath)
    }
    
}
