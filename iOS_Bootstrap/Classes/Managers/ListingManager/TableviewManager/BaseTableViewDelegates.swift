//
//  TableViewDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/8/18.
//
//  Empty Dataset library URL : https://github.com/Xiaoye220/EmptyDataSet-Swift?files=1


public protocol BaseTableViewDelegates : TableViewOptionalDelegates {
    func configureTableViewCell (tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

@objc public protocol TableViewOptionalDelegates : CommonListingDelegates {
    @objc optional func configureNumberOfRowsPerSection(tableView: UITableView, section : Int) -> Int
    @objc optional func rowDidSelected(tableView: UITableView, indexPath : IndexPath)
    @objc optional func configureAdditionalTableProperties (table : UITableView)
    @objc optional func configureHeightForRowAt (tableView: UITableView, indexPath: IndexPath) -> CGFloat
    @objc optional func configureNumberOfSections(tableView: UITableView) -> Int
    @objc optional func loadMore (tableView: UITableView, forPage page : Int, updatedDataSource : [Any])
    

}
