//
//  TableviewAdapter.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//
//  Ref: https://stackoverflow.com/questions/24103069/add-swipe-to-delete-uitableviewcell

import UIKit

open class TableviewAdapter : NSObject {
    
    private final var mTableview : UITableView!
    private var tableViewDataSource: [Any]!
    private final var mNibClass : BaseTableViewCell.Type!
    private final var mNibClasses : [BaseTableViewCell.Type]?
    public var mDelegate : BaseTableViewDelegates!
    private var mTotalNumberOfItems : Int?
    private var mItemsPerPage : Int?
    private var mNumberOfPages : Int = 0
    private var mCurrentPage : Int = 1
    private var hasMore : Bool = false
    private var firstTime : Bool = true
    private var indicator : UIActivityIndicatorView?
    
    public var getDataSource : [Any] {
        get { if (tableViewDataSource != nil) { return tableViewDataSource }; return [] }
    }
    
    public final func setDataSource (dataSource : [Any]) { tableViewDataSource = dataSource }
    
    public final func getTableView() -> UITableView { return mTableview }

    public final func configureTableWithXibCell (tableView: UITableView,
                                    dataSource: [Any]!,
                                    nibClass : BaseTableViewCell.Type!,
                                    delegate : BaseTableViewDelegates) {
        self.mNibClass = nibClass
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }
    
    public final func configureTableWithMultiXibCell (tableView: UITableView,
                                                 dataSource: [Any]!,
                                                 nibClasses : [BaseTableViewCell.Type]?,
                                                 delegate : BaseTableViewDelegates) {
        self.mNibClasses = nibClasses
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }

    public final func configureTableWithXibCell (tableView: UITableView,
                                                 nibClass : BaseTableViewCell.Type!,
                                                 delegate : BaseTableViewDelegates) {
        self.mNibClass = nibClass
        configureTable(tableView: tableView, dataSource: [], delegate: delegate)
    }
  
    private final func configureTable (tableView: UITableView,
                                       dataSource: [Any],
                                       delegate : BaseTableViewDelegates) {
        setDataSource(dataSource: dataSource)
        self.mTableview = tableView
        self.mDelegate = delegate
        //
        if (mNibClass != nil) { mTableview?.register(cellClass: mNibClass.self) }
        else if (mNibClasses != nil) {
            for nibClass in mNibClasses! { mTableview?.register(cellClass: nibClass.self) }
        }
        mTableview?.dataSource = self
        mTableview?.delegate = self
        mTableview.emptyDataSetDelegate = self
        mTableview.emptyDataSetSource = self
        mDelegate?.configureAdditionalTableProperties?(table: mTableview!)
    }
    
    //
    public final func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        if (firstTime) {
            firstTime = false
            self.mTotalNumberOfItems = totalNumberOfItems
            self.mItemsPerPage = itemsPerPage
            let tempTotalNumberOfItems : Double = Double(totalNumberOfItems)
            let tempItemsPerPage : Double = Double(itemsPerPage)
            // Calculte the total number of pages from the given parameters
            let tempNumberOfPages : Double = tempTotalNumberOfItems/tempItemsPerPage
            self.mNumberOfPages = Int(round(tempNumberOfPages))
        }
    }
    
    // Pull to refresh configuration
    public func configurePullToRefresh(refreshControl : UIRefreshControl) {
        mDelegate?.configurePullToRefresh?(refreshcontrole: refreshControl)
        refreshControl.addTarget(self, action:
            #selector(self.pullToRefresh), for: UIControlEvents.valueChanged)
        mTableview?.addSubview(refreshControl)
    }
    // Pull to refresh action
    @objc private func pullToRefresh () { mDelegate?.pullToRefresh?() }
    
  //  public final func reloadTable(pageItems:[Any], currentPage : Int) {
    public final func reloadTable(pageItems:[Any]) {
        //
        if (self.mCurrentPage < mNumberOfPages) { hasMore = true }
        //
        if (self.tableViewDataSource.isEmpty) { self.tableViewDataSource = pageItems }
        else {
            if (tableViewDataSource.count == pageItems.count) {
                if (!tableViewDataSource.description.isEqual(pageItems.description)) {
                    self.tableViewDataSource.append(contentsOf: pageItems)
                }
            }
            else { self.tableViewDataSource.append(contentsOf: pageItems) }
        }
        //
        mTableview?.reloadData()
        indicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
        self.mCurrentPage += 1
    }
    
    public final func reloadSinglePageTable(items:[Any]) {
        hasMore = false
        if (self.tableViewDataSource.isEmpty) { self.tableViewDataSource = items }
        else {
            self.tableViewDataSource.removeAll()
            self.tableViewDataSource = items
        }
        mTableview?.reloadData()
        indicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
    }
    
    public final func reloadTable() { mTableview?.reloadData() }
    
    public final func reloadTableRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        mTableview.reloadRows(at: indexPaths, with: animation)
    }
    
    public final func resetTable() {
        self.tableViewDataSource.removeAll()
        mTableview?.reloadData()
        indicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
    }
    
}

extension TableviewAdapter : UITableViewDataSource, UITableViewDelegate  {
    // TableView callbacks
    //
    // Configure number of rows/sections
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mDelegate?.configureNumberOfRowsForSection?(tableView: tableView, section: section)) != nil {
                return (mDelegate?.configureNumberOfRowsForSection!(tableView: tableView, section: section))!
            }
            else if (tableViewDataSource != nil && (tableViewDataSource?.count)! > 0) {
                return (tableViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return (mDelegate?.configureNumberOfSections?(tableView: tableView)) ?? 1
    }
    // Configure sections header if needed
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return mDelegate?.configureSectionHeaderView?(tableView: tableView, sectionNumber: section)
    }
    // Configure height of section header if needed
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return (mDelegate?.configureHeightForSectionHeader?(tableView: tableView, sectionNumber: section)) ?? UITableViewAutomaticDimension
    }
    // Configure cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  indicator?.stopAnimating()
        return (mDelegate?.configureCellForRow(tableView: mTableview, cellForRowAt: indexPath))!
    }
    // cell did selected at index
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mDelegate?.rowDidSelected?(tableView: tableView, indexPath: indexPath)
    }
    //
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (mDelegate?.configureHeightForRowAt?(tableView: tableView, indexPath: indexPath)) ?? UITableViewAutomaticDimension
    }
    // Pagination (Load more)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        mDelegate.scrollViewDidEndDragging?(scrollView, willDecelerate: decelerate)
        if (scrollView == mTableview) {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= (scrollView.contentSize.height)) {
                if (hasMore) {
                    indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                    indicator?.startAnimating()
                    indicator?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: mTableview.bounds.width, height: CGFloat(45))
                    mTableview.tableFooterView = indicator
                    mTableview.tableFooterView?.isHidden = false
                    //
                    hasMore = false
                    mDelegate.loadMore?(tableView: mTableview, forPage: mCurrentPage, updatedDataSource: tableViewDataSource)
                }
                else { mDelegate?.noMoreResutlsToLoad?() }
            }
            else {
                indicator?.stopAnimating()
                mTableview.tableFooterView?.isHidden = true
            }
        }
        DispatchQueue.main.async {
            self.indicator?.stopAnimating()
            self.mTableview.tableFooterView?.isHidden = true
        }
    }

    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return (mDelegate?.canEditRow?()) ?? false
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if (mDelegate?.canEditRow!())! {
            mDelegate.editRowAtIndexPath?(tableView: tableView, commit: editingStyle, forRowAt: indexPath)
        }
    }
    
    public func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        if (mDelegate?.canEditRow!())! {
            return mDelegate?.editActionsRowAtIndexPath!(tableView: tableView, indexPath: indexPath)
        }
        // Must enable canEditRow to use this feature
        return [UITableViewRowAction]()
    }
    
    @available(iOS 11.0, *)
    public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        if (mDelegate?.canEditRow!())! {
            return mDelegate.configureSwipAction?(tableView: tableView, indexPath: indexPath)
        }
        // Must enable canEditRow to use this feature
        return UISwipeActionsConfiguration()
    }
    
}

extension TableviewAdapter : EmptyDataSetSource, EmptyDataSetDelegate {
    //
    public func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool {
        return (mDelegate?.emptyDataSetShouldDisplay?()) ?? false
    }
    
    public func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return (mDelegate?.emptyDataSetTitleText?())
    }
    
    public func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
        return (mDelegate?.emptyDataSetDescriptionText?())

    }
    public func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
        return (mDelegate?.emptyDataSetImage?())
    }
    
    public func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {
        mDelegate?.emptyDataSetClicked?(didTap: view)
    }
    
    public func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool {
        return (mDelegate?.emptyDataSetAllowTouch?()) ?? true
    }
    
    public func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? {
        return (mDelegate?.emptyDataSetCustomView?())
    }
    
    public func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? {
        return (mDelegate?.emptyDataSetBackgroundColor?())
    }
    
    public func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? {
        return (mDelegate?.emptyDataSetAnimatedImage?())
    }
    
    public func buttonImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> UIImage? {
        return (mDelegate?.emptyDataSetButtonImage?())
    }
    
    public func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> UIImage? {
        return (mDelegate?.emptyDataSetButtonBackgroundImage?())
    }
    
    public func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
        return (mDelegate?.emptyDataSetButtonLabel?())
    }
    
    public func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {
         mDelegate?.emptyDataSetButtonTapped?(didTapButton: button)
    }
    
}

