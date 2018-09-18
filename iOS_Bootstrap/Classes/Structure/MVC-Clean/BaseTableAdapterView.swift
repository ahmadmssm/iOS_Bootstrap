//
//  BaseTableAdapterView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableAdapterView<D>: BaseView {
    //
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    private var tableViewDataSource : [D] = [D]()
    //
    public final var getTableViewAdapter : TableviewAdapter { get { return tableViewAdapter } }
    public var getTableViewDataSource : [D] {
        set (newDataSource) { tableViewDataSource = newDataSource }
        get { return tableViewDataSource }
    }
}

