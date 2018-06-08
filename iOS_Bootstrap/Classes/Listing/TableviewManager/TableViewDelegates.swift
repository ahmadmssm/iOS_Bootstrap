//
//  TableViewDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/8/18.
//

import Foundation

@objc public protocol TableViewDelegates {
    func configureCell (cellForRowAt indexPath: IndexPath) -> UITableViewCell
    func configureNumberOfRowsPerSection(section : Int) -> Int
    @objc optional func configureNumberOfSections() -> Int
    @objc optional func rowDidSelected(atIndexPath : IndexPath)
    @objc optional func loadMore (indexPath: IndexPath)
    @objc optional func configurePullToRefresh (refreshcontrole : UIRefreshControl)
    @objc optional func pullToRefresh (refreshcontrole : UIRefreshControl)
    @objc optional func configureAdditionalTableProperties (table : UITableView)
    // Emty DZNemptyDataset callbacks
    @objc optional func emptyDataSetShouldDisplay () -> Bool
}
