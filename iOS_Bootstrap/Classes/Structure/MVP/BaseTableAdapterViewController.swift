//
//  BaseTableAdapterViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableAdapterViewController <T, D> :
                            BaseViewController<T, D>
                            where T : BasePresenter<D> {
    
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    public func getTableViewAdapter() -> TableviewAdapter { return tableViewAdapter }

}
