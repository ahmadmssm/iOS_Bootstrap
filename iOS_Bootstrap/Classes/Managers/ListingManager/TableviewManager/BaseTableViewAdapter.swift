//
//  BaseTableViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/16/19.
//
//  Empty Dataset library URL : https://github.com/Xiaoye220/EmptyDataSet-Swift?files=1
//

open class BaseTableViewAdapter<TableView: UITableView, CellItem: Equatable>: NSObject,
                                                                              UITableViewDataSource,
                                                                              UITableViewDelegate,
                                                                              EmptyDataSetSource,
                                                                              EmptyDataSetDelegate,
                                                                              ListingAdapterDelegate {
    //
    private final var mTableview: TableView!
    private var tableViewDataSource: [CellItem]?
    private var mNumberOfPages: Int = 0
    private var mCurrentPage: Int = 1
    private var hasMore: Bool = false
    private var firstTime: Bool = true
    public private(set) var loadingIndicator: UIActivityIndicatorView?
    
    open var dataSource: [CellItem] {
        set {
            tableViewDataSource = newValue
        }
        get {
            return tableViewDataSource ?? []
        }
    }
    
    public convenience init(tableView: TableView,
                     xibCell: BaseTableViewCell.Type,
                     dataSource: [CellItem] = []) {
        self.init(tableView: tableView, xibCells: xibCell, dataSource: dataSource)
    }
    
    public convenience init(tableView: TableView,
                            cellClass: BaseTableViewCell.Type,
                             dataSource: [CellItem] = []) {
           self.init(tableView: tableView, cellClasses: cellClass, dataSource: dataSource)
    }
    
    public init(tableView: TableView, xibCells: BaseTableViewCell.Type..., dataSource: [CellItem] = []) {
        super.init()
        configureTableWithXibCell(tableView: tableView, dataSource: dataSource, cells: xibCells)
    }
    
    public init(tableView: TableView,
                cellClasses: BaseTableViewCell.Type...,
                dataSource: [CellItem] = []) {
        super.init()
        configureTableWithXibCell(tableView: tableView, dataSource: dataSource, cells: cellClasses)
    }
    
    // Basic(Default) cell
    public init(tableView: TableView, dataSource: [CellItem] = []) {
        super.init()
        self.tableViewDataSource = dataSource
        self.mTableview = tableView
        self.mTableview.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        setUp()
    }
    
    private func configureTableWithXibCell(tableView: TableView,
                             dataSource: [CellItem],
                             cells: [BaseTableViewCell.Type]) {
        self.tableViewDataSource = dataSource
        self.mTableview = tableView
        //
        for cell in cells {
            mTableview?.register(nibClass: cell.self)
        }
        setUp()
    }
    
    private func configureTableWithCellClass(tableView: TableView,
                             dataSource: [CellItem],
                             cells: [BaseTableViewCell.Type]) {
        self.tableViewDataSource = dataSource
        self.mTableview = tableView
        //
        for cell in cells {
            mTableview?.register(cellClass: cell.self)
        }
        setUp()
    }
    
    private func setUp() {
        registerMoreCustomCells()
        mTableview.dataSource = self
        mTableview.delegate = self
        mTableview.emptyDataSetDelegate = self
        mTableview.emptyDataSetSource = self
        //
        configureAdditionalTableProperties(table: mTableview!)
    }
    //
    open func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        if (firstTime) {
            firstTime = false
            let tempTotalNumberOfItems: Double = Double(totalNumberOfItems)
            let tempItemsPerPage: Double = Double(itemsPerPage)
            // Calculte the total number of pages from the given parameters
            let tempNumberOfPages : Double = tempTotalNumberOfItems/tempItemsPerPage
            self.mNumberOfPages = Int(round(tempNumberOfPages))
        }
    }
    
    open func configurePullToRefresh(refreshControl : UIRefreshControl) {
        refreshControl.addTarget(self,
                                 action: #selector(self.pullToRefresh),
                                 for: UIControl.Event.valueChanged)
        mTableview.addSubview(refreshControl)
    }
    //
    public final func getTableView() -> TableView {
        return mTableview
    }

    public final func clearDataSource () {
        self.tableViewDataSource?.removeAll()
    }
    //
    open func reloadTable(pageItems: [CellItem]) {
        //
        if (self.mCurrentPage < mNumberOfPages) {
            hasMore = true
        }
        //
        if (self.tableViewDataSource?.isEmpty ?? true) {
            self.tableViewDataSource = pageItems
        }
        else {
            if (tableViewDataSource?.count == pageItems.count) {
                if (!(tableViewDataSource ?? [] == pageItems)) {
                    self.tableViewDataSource?.append(contentsOf: pageItems)
                }
            }
            else {
                self.tableViewDataSource?.append(contentsOf: pageItems)
            }
        }
        //
        mTableview.reloadData()
        loadingIndicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
        self.mCurrentPage += 1
    }
    
    open func reloadSinglePageTable(items: [CellItem]) {
        hasMore = false
        if (self.tableViewDataSource?.isEmpty ?? true) {
            self.tableViewDataSource = items
        }
        else {
            self.tableViewDataSource?.removeAll()
            self.tableViewDataSource = items
        }
        mTableview.reloadData()
        loadingIndicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
    }
    
    open func reloadTable() {
        mTableview?.reloadData()
    }
    
    open func reloadTableRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) {
           mTableview.reloadRows(at: indexPaths, with: animation)
    }
    
    open func resetTable() {
        self.tableViewDataSource?.removeAll()
        mTableview?.reloadData()
        loadingIndicator?.stopAnimating()
        mTableview.tableFooterView?.isHidden = true
    }
    
    open func showBottomLoader() {
        self.loadingIndicator?.startAnimating()
        self.mTableview.tableFooterView?.isHidden = false
    }
    
    open func hideBottomLoader() {
        self.loadingIndicator?.stopAnimating()
        self.mTableview.tableFooterView?.isHidden = true
    }
    //
    open func initCell<Cell: BaseGenericTableViewCell<CellItem>>(cell: Cell.Type,
                                                            indexPath: IndexPath) -> Cell {
        let cell: Cell = mTableview.dequeueReusableCell(forIndexPath: indexPath)
        if (getCellModel(indexPath: indexPath) != nil) {
            cell.cellModel = getCellModel(indexPath: indexPath)
        }
        return cell
    }
    
    public final func getCellModel(indexPath: IndexPath) -> CellItem? {
        if let cellModel = tableViewDataSource?[exist: indexPath.row] {
            return cellModel
        }
        return nil
    }
    //
    open func shouldEnableBottomActivityIndicator() -> Bool {
        return true
    }
    open func configureBottomActivityIndicatorView() -> UIActivityIndicatorView {
        return UIActivityIndicatorView(activityIndicatorStyle: .gray)
    }
    open func loadMore(tableView: UITableView, forPage page: Int, updatedDataSource: [CellItem]) {}
    open func noMoreResutlsToLoad() {}
    open func registerMoreCustomCells() {}
    open func configureAdditionalTableProperties(table: TableView) {}
    //
    @objc open func pullToRefresh() {}
    //
    // TableView callbacks
    //
    // Configure number of rows/sections
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (tableViewDataSource != nil && tableViewDataSource?.count ?? 0 > 0) {
            return (tableViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Configure sections header if needed
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    // Configure height of section header if needed
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Configure cell
    open func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    open func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
    open func tableView(_ tableView: UITableView,
                        editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        // Must enable canEditRow to use this feature
        return [UITableViewRowAction]()
    }
    
    @available(iOS 11.0, *)
    open func tableView(_ tableView: UITableView,
                        trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Must enable canEditRow to use this feature
        return UISwipeActionsConfiguration()
    }

    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }

    open func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                        withVelocity velocity: CGPoint,
                                        targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
    open func tableView(_ tableView: UITableView,
                        commit editingStyle: UITableViewCell.EditingStyle,
                        forRowAt indexPath: IndexPath) {}
    open func tableView(_ tableView: UITableView,
                          willDisplayHeaderView view: UIView,
                          forSection section: Int) {}
    open func tableView(_ tableView: UITableView,
                        didEndDisplayingHeaderView view: UIView,
                        forSection section: Int) {}
    //
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {}
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {}
    open func scrollViewDidScroll(_ scrollView: UIScrollView) {}
    //
    // Pagination (Load more)
    open func tableView(_ tableView: UITableView,
                        willDisplay cell: UITableViewCell,
                        forRowAt indexPath: IndexPath) {
        //
        let lastElement = (tableViewDataSource?.count ?? 0) - 1
        if indexPath.row == lastElement {
            if (hasMore) {
                if (shouldEnableBottomActivityIndicator()) {
                    loadingIndicator = configureBottomActivityIndicatorView()
                    loadingIndicator?.startAnimating()
                    loadingIndicator?.frame = CGRect(x: CGFloat(0),
                                              y: CGFloat(0),
                                              width: mTableview.bounds.width,
                                              height: CGFloat(45))
                    mTableview.tableFooterView = loadingIndicator
                    mTableview.tableFooterView?.isHidden = false
                }
                //
                hasMore = false
                loadMore(tableView: mTableview,
                         forPage: mCurrentPage,
                         updatedDataSource: tableViewDataSource ?? [])
               }
               else {
                  noMoreResutlsToLoad()
               }
        }
    }
    //
    // Empty Table view callbacks
    //
    open func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {}
    open func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {}
    //
    open func emptyDataSetShouldDisplay(_ scrollView: UIScrollView) -> Bool { return false }
    open func emptyDataSetShouldAllowTouch(_ scrollView: UIScrollView) -> Bool { return true }
    open func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? { return nil }
    open func customView(forEmptyDataSet scrollView: UIScrollView) -> UIView? { return nil }
    open func backgroundColor(forEmptyDataSet scrollView: UIScrollView) -> UIColor? { return nil }
    open func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? { return nil }
    open func imageAnimation(forEmptyDataSet scrollView: UIScrollView) -> CAAnimation? { return nil }
    open func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? { return nil }
    //
    open func buttonImage(forEmptyDataSet scrollView: UIScrollView,
                          for state: UIControl.State) -> UIImage? { return nil }
    open func buttonBackgroundImage(forEmptyDataSet scrollView: UIScrollView,
                                    for state: UIControl.State) -> UIImage? { return nil }
    open func buttonTitle(forEmptyDataSet scrollView: UIScrollView,
                          for state: UIControl.State) -> NSAttributedString? { return nil }
    open func tableView(_ tableView: UITableView,
                        titleForHeaderInSection section: Int) -> String? { return nil }
    open func tableView(_ tableView: UITableView,
                        titleForFooterInSection section: Int) -> String? { return nil }
}

public extension UITableView {
    func dequeueReusableDefaultCell() -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: "DefaultCell")!
    }
    
    func dequeueReusableDefaultCell(indexPath: IndexPath) -> UITableViewCell {
        return self.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
    }
}

