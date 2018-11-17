//
//  TableviewAdapter.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class TableviewAdapter : NSObject {
    
    private final var mTableview : UITableView!
    fileprivate var tableViewDataSource: [Any]!
    private final var mNibClass : BaseTableViewCell.Type!
    fileprivate final var mDelegate : BaseTableViewDelegates!
    //
    fileprivate var mTotalNumberOfItems : Int?
    fileprivate var mItemsPerPage : Int?
    fileprivate var mNumberOfPages : Int = 0
    fileprivate var mCurrentPage : Int = 1
    fileprivate var hasMore : Bool = false
    //
    private var firstTime : Bool = true
    //
    fileprivate var indicator : UIActivityIndicatorView?
    //
//    public fileprivate(set) var expandedSections: [Int: Bool] = [:]
//    open var expandingAnimation: UITableViewRowAnimation = ExpandableTableViewDefaultValues.expandingAnimation
//    open var collapsingAnimation: UITableViewRowAnimation = ExpandableTableViewDefaultValues.collapsingAnimation
    //
    
    public var getDataSource : [Any] {
        get { if (tableViewDataSource != nil) { return tableViewDataSource }; return [] }
    }
    
    func getTableView() -> UITableView { return mTableview }

    public final func setDataSource (dataSource : [Any]) { tableViewDataSource = dataSource }
        
    public final func configureTableWithXibCell (tableView: UITableView,
                                    dataSource: [Any]!,
                                    nibClass : BaseTableViewCell.Type!,
                                    delegate : BaseTableViewDelegates) {
        //
        self.mNibClass = nibClass
        mTableview?.register(cellClass: mNibClass.self)
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }
    
    public final func configureTableWithXibCell (tableView: UITableView,
                                                 nibClass : BaseTableViewCell.Type!,
                                                 delegate : BaseTableViewDelegates) {
        //
        self.mNibClass = nibClass
        mTableview?.register(cellClass: mNibClass.self)
        configureTable(tableView: tableView, dataSource: [], delegate: delegate)
    }
    
    public final func configureTableWithStoryboardCell (tableView: UITableView,
                                           dataSource: [Any],
                                           nibClass : BaseTableViewCell.Type!,
                                           delegate : BaseTableViewDelegates) {
        //
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }
    
    private final func configureTable (tableView: UITableView,
                                       dataSource: [Any],
                                       delegate : BaseTableViewDelegates) {
        // self.tableViewDataSource = dataSource
        setDataSource(dataSource: dataSource)
        self.mTableview = tableView
        self.mDelegate = delegate
        //
        mTableview?.register(cellClass: mNibClass.self)
        mTableview?.dataSource = self
        mTableview?.delegate = self
        //
        mTableview.emptyDataSetDelegate = self
        mTableview.emptyDataSetSource = self
        //
        mDelegate?.configureAdditionalTableProperties?(table: mTableview!)
    }
    
    //
    public final func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        if (firstTime) {
            firstTime = false
            //
            self.mTotalNumberOfItems = totalNumberOfItems
            self.mItemsPerPage = itemsPerPage
            // Calculte the total number of pages from the given parameters
            var tempNumberOfPages : Double = Double(totalNumberOfItems/itemsPerPage)
            if (tempNumberOfPages - round(tempNumberOfPages) < 0) {
                tempNumberOfPages = round(tempNumberOfPages) + 1
                self.mNumberOfPages = Int(tempNumberOfPages)
            }
            else {
                self.mNumberOfPages = totalNumberOfItems/itemsPerPage
            }
        }
    }
    
    // Pull to refresh configuration
    public func configurePullToRefresh(refreshControl : UIRefreshControl) {
        mDelegate?.configurePullToRefresh?(refreshcontrole: refreshControl)
        refreshControl.addTarget(self, action:
            #selector(self.pullToRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        mTableview?.addSubview(refreshControl)
    }
    // Pull to refresh action
    @objc private func pullToRefresh (_ refreshControl: UIRefreshControl) {
        mDelegate?.pullToRefresh?(refreshcontrole: refreshControl)
    }
    
  //  public final func reloadTable(pageItems:[Any], currentPage : Int) {
    public final func reloadTable(pageItems:[Any]) {
        //
       // self.mCurrentPage = currentPage
       // self.mCurrentPage += 1
//        if (currentPage < mNumberOfPages) { hasMore = true }
        if (self.mCurrentPage < mNumberOfPages) {
            hasMore = true
        }
        //
        if (self.tableViewDataSource.isEmpty) { self.tableViewDataSource = pageItems }
        else {
            if (tableViewDataSource.count == pageItems.count) {
                if (!tableViewDataSource.description.isEqual(pageItems.description)) {
                    self.tableViewDataSource.append(contentsOf: pageItems)
                }
            }
            else {
                self.tableViewDataSource.append(contentsOf: pageItems)
            }
        }
        //
        mTableview?.reloadData()
        //
        indicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
        self.mCurrentPage += 1
    }
    
    public final func reloadTable() {
        mTableview?.reloadData()
    }
    
    public final func reloadTableRows(at indexPaths: [IndexPath], with animation: UITableViewRowAnimation) {
        mTableview.reloadRows(at: indexPaths, with: animation)
    }
    
}

extension TableviewAdapter {
//    public func expand(_ section: Int) {
//        animate(with: .expand, forSection: section)
//    }
//
//    public func collapse(_ section: Int) {
//        animate(with: .collapse, forSection: section)
//    }
//
//    private func animate(with type: ExpandableTableViewActionType, forSection section: Int) {
//        guard canExpand(section) else { return }
//        let sectionIsExpanded = didExpand(section)
//        //If section is visible and action type is expand, OR, If section is not visible and action type is collapse, return.
//        if ((type == .expand) && (sectionIsExpanded)) || ((type == .collapse) && (!sectionIsExpanded)) {
//            return
//        }
//        assign(section, asExpanded: (type == .expand))
//        startAnimating(self.mTableview, with: type, forSection: section)
//    }
//
//    private func startAnimating(_ tableView: UITableView, with type: ExpandableTableViewActionType, forSection section: Int) {
//
//        let headerCell = (self.mTableview.cellForRow(at: IndexPath(row: 0, section: section)))
//        let headerCellConformant = headerCell as? ExpyTableViewHeaderCell
//
//        CATransaction.begin()
//        headerCell?.isUserInteractionEnabled = false
//
//        //Inform the delegates here.
//        headerCellConformant?.changeState((type == .expand ? .willExpand : .willCollapse), cellReuseStatus: false)
//        mDelegate?.tableView(tableView, expyState: (type == .expand ? .willExpand : .willCollapse), changeForSection: section)
//
//        CATransaction.setCompletionBlock {
//            //Inform the delegates here.
//            headerCellConformant?.changeState((type == .expand ? .didExpand : .didCollapse), cellReuseStatus: false)
//
//            self.mDelegate?.tableView(tableView, expyState: (type == .expand ? .didExpand : .didCollapse), changeForSection: section)
//            headerCell?.isUserInteractionEnabled = true
//        }
//
//        self.mTableview.beginUpdates()
//
//        //Don't insert or delete anything if section has only 1 cell.
//        if let sectionRowCount = mTableview.dataSource?.tableView(tableView, numberOfRowsInSection: section), sectionRowCount > 1 {
//
//            var indexesToProcess: [IndexPath] = []
//
//            //Start from 1, because 0 is the header cell.
//            for row in 1..<sectionRowCount {
//                indexesToProcess.append(IndexPath(row: row, section: section))
//            }
//
//            //Expand means inserting rows, collapse means deleting rows.
//            if type == .expand {
//                mTableview.insertRows(at: indexesToProcess, with: expandingAnimation)
//            }
//            else if type == .collapse {
//                mTableview.deleteRows(at: indexesToProcess, with: collapsingAnimation)
//            }
//        }
//        mTableview.endUpdates()
//
//        CATransaction.commit()
//    }
//
//    private func canExpand(_ section: Int) -> Bool {
//        //If canExpandSections delegate method is not implemented, it defaults to true.
//        return mDelegate.tableView?(mTableview, canExpandSection: section) ?? ExpandableTableViewDefaultValues.expandableStatus
//    }
//
//    private func didExpand(_ section: Int) -> Bool {
//        return expandedSections[section] ?? false
//    }
//
//    private func assign(_ section: Int, asExpanded: Bool) {
//        expandedSections[section] = asExpanded
//    }
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
//        if (mDelegate?.withExpandableCell?() != nil && (mDelegate?.withExpandableCell?())!) {
//            return (mDelegate?.configureNumberOfSections?(tableView: tableView)) ?? tableViewDataSource.count
//        }
        return (mDelegate?.configureNumberOfSections?(tableView: tableView)) ?? 1
    }
    // Configure cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      //  indicator?.stopAnimating()
        return (mDelegate?.configureTableViewCell(tableView: mTableview, cellForRowAt: indexPath))!
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
        if (scrollView == mTableview) {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= (scrollView.contentSize.height)) {
                //
                if (hasMore) {
                    indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                    indicator?.startAnimating()
                    indicator?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: mTableview.bounds.width, height: CGFloat(45))
                    mTableview.tableFooterView = indicator
                    mTableview.tableFooterView?.isHidden = false
                    //
                    hasMore = false
                  //  mDelegate?.loadMore?()
                    mDelegate.loadMore?(tableView: mTableview, forPage: mCurrentPage, updatedDataSource: tableViewDataSource)
                }
            }
            else {
                indicator?.stopAnimating()
                mTableview.tableFooterView?.isHidden = true
            }
        }
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

