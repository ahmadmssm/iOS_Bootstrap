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
    @objc optional func configureSectionHeaderView(tableView: UITableView, sectionNumber: Int) -> UIView?
    @objc optional func rowDidSelected(tableView: UITableView, indexPath : IndexPath)
    @objc optional func configureAdditionalTableProperties (table : UITableView)
    @objc optional func configureHeightForRowAt (tableView: UITableView, indexPath: IndexPath) -> CGFloat
    @objc optional func configureHeightForSectionHeader (tableView: UITableView, sectionNumber: Int) -> CGFloat
    @objc optional func configureNumberOfSections(tableView: UITableView) -> Int
    @objc optional func loadMore (tableView: UITableView, forPage page : Int, updatedDataSource : [Any])
    @objc optional func canEditRow () -> Bool
    @objc optional func editRowAtIndexPath (tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
    @objc optional func editActionsRowAtIndexPath(tableView: UITableView, indexPath: IndexPath) -> [UITableViewRowAction]?
    @available(iOS 11.0, *)
    @objc optional func configureSwipAction(tableView: UITableView, indexPath: IndexPath) -> UISwipeActionsConfiguration?
    @objc optional func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    @objc optional func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int)
    @objc optional func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    @objc optional func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool
    @objc optional func shouldEnableBottomActivityIndicator() -> Bool
    @objc optional func getBottomActivityIndicatorView() -> UIActivityIndicatorView
}

