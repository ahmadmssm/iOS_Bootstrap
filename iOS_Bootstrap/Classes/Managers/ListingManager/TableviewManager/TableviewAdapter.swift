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
    private final var tableViewDataSource: [Any]!
    private final var mNibClass : BaseTableViewCell.Type!
    fileprivate final var mDelegate : TableViewDelegates!

    public final func configureTableWithXibCell (tableView: UITableView,
                                    dataSource: [Any]!,
                                    nibClass : BaseTableViewCell.Type!,
                                    delegate : TableViewDelegates) {
        //
        self.mNibClass = nibClass
        mTableview?.register(cellClass: mNibClass.self)
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }
    
    public final func configureTableWithStoryboardCell (tableView: UITableView,
                                           dataSource: [Any],
                                           nibClass : BaseTableViewCell.Type!,
                                           delegate : TableViewDelegates) {
        //
        configureTable(tableView: tableView, dataSource: dataSource, delegate: delegate)
    }
    
    private final func configureTable (tableView: UITableView,
                                           dataSource: [Any],
                                           delegate : TableViewDelegates) {
        self.tableViewDataSource = dataSource
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
    
    public final func reloadTable(dataSource:[Any]) {
        self.tableViewDataSource = dataSource
        mTableview?.reloadData()
    }
}

extension TableviewAdapter : UITableViewDataSource, UITableViewDelegate  {
    // TableView callbacks
    //
    // Configure number of rows/sections
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (mDelegate?.configureNumberOfRowsPerSection?(section: section)) != nil {
            return (mDelegate?.configureNumberOfRowsPerSection!(section: section))!
        }
        else if (tableViewDataSource != nil && (tableViewDataSource?.count)! > 0) {
            return (tableViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    public func numberOfSections(in tableView: UITableView) -> Int {
        return (mDelegate?.configureNumberOfSections?()) ?? 1
    }
    // Configure cell
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return (mDelegate?.configureCell(cellForRowAt: indexPath))!
    }
    // cell did selected at index
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        mDelegate?.rowDidSelected?(indexPath: indexPath)
    }
    // Pagination
    public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        mDelegate?.loadMore?(indexPath: indexPath)
    }
}

extension TableviewAdapter : EmptyDataSetSource, EmptyDataSetDelegate {
    //
    func emptyDataSetShouldDisplay(_ scrollView: UIScrollView!) -> Bool {
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

