//
//  BaseLiveTableViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/13/18.
//


open class BaseLiveTableViewController<T, V, D>:
                                BaseTableViewController <T, V, D>,
                                LiveDataProtocol
                                where T: BaseLiveListingPresenter<V, D> {
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        getPresenter().bindListingView(self)
    }
    
    func dataSourceDidChanged(dataSource: [Any]) {
        getTableViewAdapter().reloadTable(pageItems: dataSource as! [D])
    }
    
    func didGetPageParams(totalNumberOfItems: Int, itemsPerPage: Int) {
        // Configure pagination parameters
        getTableViewAdapter().configurePaginationParameters(totalNumberOfItems: totalNumberOfItems, itemsPerPage: itemsPerPage)
        // Reload table with new page items only (Not the whole data source)
    }
    
}

