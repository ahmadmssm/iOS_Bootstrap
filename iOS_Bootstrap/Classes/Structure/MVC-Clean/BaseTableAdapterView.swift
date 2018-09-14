//
//  BaseTableAdapterView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseTableAdapterView: BaseView {
    private let tableViewAdapter : TableviewAdapter = TableviewAdapter()
    public func getTableViewAdapter() -> TableviewAdapter { return tableViewAdapter }
}

