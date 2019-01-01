//
//  TableViewDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/8/18.
//
//  Empty Dataset library URL : https://github.com/Xiaoye220/EmptyDataSet-Swift?files=1


public protocol BaseTableViewDelegates : TableViewOptionalDelegates {
    func configureCellForRow (tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
}

@objc public protocol TableViewOptionalDelegates : CommonListingDelegates {
    @objc optional func configureNumberOfRowsForSection(tableView: UITableView, section : Int) -> Int
    @objc optional func rowDidSelected(tableView: UITableView, indexPath : IndexPath)
    @objc optional func configureAdditionalTableProperties (table : UITableView)
    @objc optional func configureHeightForRowAt (tableView: UITableView, indexPath: IndexPath) -> CGFloat
    @objc optional func configureNumberOfSections(tableView: UITableView) -> Int
    @objc optional func loadMore (tableView: UITableView, forPage page : Int, updatedDataSource : [Any])
    @objc optional func canEditRow () -> Bool
    @objc optional func editRowAtIndexPath (tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    @objc optional func editActionsRowAtIndexPath(tableView: UITableView, indexPath: IndexPath) -> [UITableViewRowAction]?
    @available(iOS 11.0, *)
    @objc optional func configureSwipAction(tableView: UITableView, indexPath: IndexPath) -> UISwipeActionsConfiguration?
}

