//
//  ListingAdapterDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/16/19.
//

public protocol ListingAdapterDelegates {
    associatedtype CellItem
    func noMoreResutlsToLoad()
    func pullToRefresh()
    func registerMoreCustomCells()
    func configurePaginationParameters(totalNumberOfItems: Int, itemsPerPage : Int)
    func configurePullToRefresh(refreshControl: UIRefreshControl)
}
