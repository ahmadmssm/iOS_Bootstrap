//
//  BaseCollectionViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/1/19.
//
//  Empty Dataset library URL : https://github.com/Xiaoye220/EmptyDataSet-Swift?files=1
//

open class BaseCollectionViewAdapter<CollectionView: UICollectionView, CellItem: Equatable>:
                                                     NSObject,
                                                     UICollectionViewDataSource,
                                                     UICollectionViewDelegate,
                                                     UICollectionViewDelegateFlowLayout,
                                                     EmptyDataSetSource,
                                                     EmptyDataSetDelegate,
                                                     ListingAdapterDelegate {
    
    private final weak var mCollectionview : CollectionView!
    private var collectionViewDataSource: [CellItem]?
    private var mNumberOfPages : Int = 0
    private var mCurrentPage : Int = 1
    private var hasMore : Bool = false
    private var firstTime : Bool = true
    public private(set) var loadingIndicator : UIActivityIndicatorView?
       
    open var dataSource: [CellItem] {
        set {
            collectionViewDataSource = newValue
        }
        get {
            return collectionViewDataSource ?? []
        }
    }
    
    
    public convenience init(collectionView: CollectionView,
                            xibCell: BaseCollectionViewCell.Type,
                            dataSource: [CellItem] = []) {
        self.init(collectionView: collectionView, xibCells: xibCell, dataSource: dataSource)
    }
       
    public convenience init(collectionView: CollectionView,
                            cellClass: BaseCollectionViewCell.Type,
                            dataSource: [CellItem] = []) {
        self.init(collectionView: collectionView, cellClasses: cellClass, dataSource: dataSource)
    }
       
    public init(collectionView: CollectionView,
                xibCells: BaseCollectionViewCell.Type...,
                dataSource: [CellItem] = []) {
        super.init()
        configureCollectionViewWithXibCell(collectionView: collectionView,
                                        dataSource: dataSource,
                                        cells: xibCells)
    }
    
    public init(collectionView: CollectionView,
                cellClasses: BaseCollectionViewCell.Type...,
                dataSource: [CellItem] = []) {
        super.init()
        configureCollectionViewWithXibCell(collectionView: collectionView, dataSource: dataSource, cells: cellClasses)
    }
       
    // Basic(Default) cell
    public init(collectionView: CollectionView, dataSource: [CellItem] = []) {
        super.init()
        self.collectionViewDataSource = dataSource
        self.mCollectionview = collectionView
        self.mCollectionview.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        setUp()
    }
       
    private func configureCollectionViewWithXibCell(collectionView: CollectionView,
                                                    dataSource: [CellItem],
                                                    cells: [BaseCollectionViewCell.Type]) {
        self.collectionViewDataSource = dataSource
        self.mCollectionview = collectionView
        //
        for cell in cells {
            mCollectionview.registerCell(cellClass: cell.self)
        }
        setUp()
    }
       
    private func configureCollectionViewWithCellClass(collectionView: CollectionView,
                                                      dataSource: [CellItem],
                                                      cells: [BaseCollectionViewCell.Type]) {
        self.collectionViewDataSource = dataSource
        self.mCollectionview = collectionView
        //
        for cell in cells {
            mCollectionview.registerCell(cellClass: cell.self)
        }
        setUp()
    }
       
    private func setUp() {
        registerMoreCustomCells()
        mCollectionview.dataSource = self
        mCollectionview.delegate = self
        mCollectionview.emptyDataSetDelegate = self
        mCollectionview.emptyDataSetSource = self
        //
        configureAdditionalCollectionViewProperties(collectionView: mCollectionview!)
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
        mCollectionview.addSubview(refreshControl)
    }
    //
    public final func getCollectionView() -> CollectionView {
        return mCollectionview
    }

    public final func clearDataSource () {
        self.collectionViewDataSource?.removeAll()
    }
    //
    open func reloadCollectionView(pageItems: [CellItem]) {
        if (self.mCurrentPage < mNumberOfPages) {
            hasMore = true
        }
        if (self.collectionViewDataSource?.isEmpty ?? true) {
            self.collectionViewDataSource = pageItems
        }
        else {
            if (collectionViewDataSource?.count == pageItems.count) {
                if (!(collectionViewDataSource ?? [] == pageItems)) {
                    self.collectionViewDataSource?.append(contentsOf: pageItems)
                }
            }
            else {
                self.collectionViewDataSource?.append(contentsOf: pageItems)
            }
        }
        mCollectionview?.reloadData()
        loadingIndicator?.stopAnimating()
        self.mCurrentPage += 1
    }
    
    open func reloadSinglePageCollectionView(items: [CellItem]) {
        hasMore = false
        if (self.collectionViewDataSource?.isEmpty ?? true) {
            self.collectionViewDataSource = items
        }
        else {
            self.collectionViewDataSource?.removeAll()
            self.collectionViewDataSource = items
        }
        mCollectionview.reloadData()
        loadingIndicator?.stopAnimating()
    }
    
    open func reloadCollectionView() {
        mCollectionview.reloadData()
    }
    
    open func reloadCollectionViewRows(at indexPaths: [IndexPath]) {
           mCollectionview.reloadItems(at: indexPaths)
    }
    
    open func resetCollectionView() {
        self.collectionViewDataSource?.removeAll()
        mCollectionview.reloadData()
        loadingIndicator?.stopAnimating()
    }
    
//    open func showBottomLoader() {
//        self.loadingIndicator?.startAnimating()
//        self.mCollectionview.tableFooterView?.isHidden = false
//    }
//
//    open func hideBottomLoader() {
//        self.loadingIndicator?.stopAnimating()
//        self.mCollectionview.tableFooterView?.isHidden = true
//    }
    
    open func getCollectionViewFlowLayout() -> UICollectionViewFlowLayout? {
        return mCollectionview.collectionViewLayout as? UICollectionViewFlowLayout
    }
    //
    open func initCell<Cell: BaseGenericCollectionViewCell<CellItem>>(cell: Cell.Type,
                                                                 indexPath: IndexPath) -> Cell {
        let cell: Cell = mCollectionview.dequeueReusableCell(forIndexPath: indexPath)
        if (getCellModel(indexPath: indexPath) != nil) {
            cell.cellModel = getCellModel(indexPath: indexPath)
        }
        return cell
    }
    
    public final func getCellModel(indexPath: IndexPath) -> CellItem? {
        if let cellModel = collectionViewDataSource?[exist: indexPath.row] {
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
    open func loadMore(collectionView: UICollectionView,
                       forPage page: Int,
                       updatedDataSource: [CellItem]) {}
    open func noMoreResutlsToLoad() {}
    open func registerMoreCustomCells() {}
    open func configureAdditionalCollectionViewProperties(collectionView: CollectionView) {}
    //
    @objc open func pullToRefresh() {}

    // Helpers
    open func getSquareSizedCells (padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    //
    // CollectionView callbacks
    //
    // Configure number of rows/sections
    open func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
        if (collectionViewDataSource != nil && collectionViewDataSource?.count ?? 0 > 0) {
            return (collectionViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    open func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    // Configure cell dimensions (width & height)
    // Default is square sized items
    open func collectionView(_ collectionView: UICollectionView,
                                layout collectionViewLayout: UICollectionViewLayout,
                                sizeForItemAt indexPath: IndexPath) -> CGSize {
        return getSquareSizedCells(padding: 25)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                               viewForSupplementaryElementOfKind kind: String,
                               at indexPath: IndexPath) -> UICollectionReusableView {
        return UICollectionReusableView()
    }
    
    open func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    open func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: 0, height: 0)
    }
    
    // Configure spacing between row items
    open func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    // Configure spacing between rows
    open func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    // Configure cell
    open func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
    
    // Item did selected at index
    open func collectionView(_ collectionView: UICollectionView,
                               didSelectItemAt indexPath: IndexPath) {}
    
    open func scrollViewWillEndDragging(_ scrollView: UIScrollView,
                                          withVelocity velocity: CGPoint,
                                          targetContentOffset: UnsafeMutablePointer<CGPoint>) {}
    
    open func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {}
       
    open func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
       
    // Pagination (Load more)
    open func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {}

    // Pagination (Load more)
    open func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        //
        let lastElement = (collectionViewDataSource?.count ?? 0) - 1
        if indexPath.row == lastElement {
            if (hasMore) {
                if (shouldEnableBottomActivityIndicator()) {
                   
                }
                //
                hasMore = false
                loadMore(collectionView: mCollectionview,
                         forPage: mCurrentPage,
                         updatedDataSource: collectionViewDataSource ?? [])
            }
            else {
                noMoreResutlsToLoad()
            }
        }
    }
    
    // Empty collecion view callbacks
    open func emptyDataSet(_ scrollView: UIScrollView, didTapView view: UIView) {}
    open func emptyDataSet(_ scrollView: UIScrollView, didTapButton button: UIButton) {}
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
}
