//
//  CollectionViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//

import UIKit

open class CollectionViewAdapter: NSObject {
    
    private final var mCollectionview : UICollectionView!
    private final var collectionViewDataSource: [Any]!
    private final var mNibClass : BaseCollectionViewCell.Type!
    fileprivate final var mDelegate : BaseCollectionViewDelegates!
    fileprivate var mTotalNumberOfItems : Int?
    fileprivate var mItemsPerPage : Int?
    fileprivate var mNumberOfPages : Int = 0
    fileprivate var mCurrentPage : Int = 1
    fileprivate var hasMore : Bool = false
    private var firstTime : Bool = true
    fileprivate var indicator : UIActivityIndicatorView?
    
    public var getDataSource: [Any] {
        if (collectionViewDataSource != nil) { return collectionViewDataSource }
        return []
    }

    open func setDataSource (dataSource: [Any]) {
        self.collectionViewDataSource = dataSource
    }
  
    public final func clearDataSource () { self.collectionViewDataSource.removeAll() }
    
    public final func getTCollectionView() -> UICollectionView { return mCollectionview }

    //
    open func configureCollectionviewWithXibCell (collectionView: UICollectionView,
                                                 dataSource: [Any]!,
                                                 nibClass : BaseCollectionViewCell.Type!,
                                                 delegate : BaseCollectionViewDelegates) {
        self.mNibClass = nibClass
        mCollectionview?.register(cellClass: mNibClass.self)
        configureCollectionView(collectionView: collectionView, dataSource: dataSource, delegate: delegate)
    }
    //
    open func configureCollectionviewWithXibCell (collectionView: UICollectionView,
                                                          nibClass : BaseCollectionViewCell.Type!,
                                                          delegate : BaseCollectionViewDelegates) {
        self.mNibClass = nibClass
        mCollectionview?.register(cellClass: mNibClass.self)
        configureCollectionView(collectionView: collectionView, dataSource: [], delegate: delegate)
    }
    //
    open func configureCollectionviewWithStoryboardCell (collectionView: UICollectionView,
                                                        dataSource: [Any],
                                                        nibClass : BaseCollectionViewCell.Type!,
                                                        delegate : BaseCollectionViewDelegates) {
        configureCollectionView(collectionView: collectionView, dataSource: dataSource, delegate: delegate)
    }
    //
    open func configureCollectionView (collectionView: UICollectionView,
                                       dataSource: [Any],
                                       delegate : BaseCollectionViewDelegates) {
        setDataSource(dataSource: dataSource)
        self.mCollectionview = collectionView
        self.mDelegate = delegate
        mCollectionview?.register(cellClass: mNibClass.self)
        mCollectionview?.dataSource = self
        mCollectionview?.delegate = self
        mCollectionview.emptyDataSetDelegate = self
        mCollectionview.emptyDataSetSource = self
        //
        mDelegate.configureAdditionalCollectionViewProperties?(collectionView: collectionView)
    }
    //
    open func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        if (firstTime) {
            firstTime = false
            //
            self.mTotalNumberOfItems = totalNumberOfItems
            self.mItemsPerPage = itemsPerPage
            
            let tempTotalNumberOfItems : Double = Double(totalNumberOfItems)
            let tempItemsPerPage : Double = Double(itemsPerPage)
            
            // Calculte the total number of pages from the given parameters
            let tempNumberOfPages : Double = tempTotalNumberOfItems/tempItemsPerPage
            //
            self.mNumberOfPages = Int(round(tempNumberOfPages))
        }
    }
    // Pull to refresh configuration
    open func configurePullToRefresh(refreshControl : UIRefreshControl) {
        mDelegate?.configurePullToRefresh?(refreshcontrole: refreshControl)
        refreshControl.addTarget(self, action:
            #selector(self.pullToRefresh),
                                 for: UIControlEvents.valueChanged)
        mCollectionview?.addSubview(refreshControl)
    }
    // Pull to refresh action
    @objc private func pullToRefresh () { mDelegate?.pullToRefresh?() }
    //
    open func reloadCollectionView(pageItems:[Any]) {
        //
        if (self.mCurrentPage < mNumberOfPages) { hasMore = true }
        if (self.collectionViewDataSource.isEmpty) { self.collectionViewDataSource = pageItems }
        else {
            if (collectionViewDataSource.count == pageItems.count) {
                if (!collectionViewDataSource.description.isEqual(pageItems.description)) {
                    self.collectionViewDataSource.append(contentsOf: pageItems)
                }
            }
            else { self.collectionViewDataSource.append(contentsOf: pageItems) }
        }
        //
        mCollectionview?.reloadData()
        indicator?.stopAnimating()
        self.mCurrentPage += 1
    }
    
    open func reloadSinglePageCollectionView(items:[Any]) {
        hasMore = false
        if (self.collectionViewDataSource.isEmpty) { self.collectionViewDataSource = items }
        else {
            self.collectionViewDataSource.removeAll()
            self.collectionViewDataSource = items
        }
        mCollectionview?.reloadData()
        indicator?.stopAnimating()
    }
    
    public final func reloadCollectionView() { mCollectionview?.reloadData() }
    
    open func resetCollectionView() {
        self.collectionViewDataSource.removeAll()
        mCollectionview?.reloadData()
        indicator?.stopAnimating()
    }
    
    // return cells that are square sized
    open func configurePaddingForSquareSizedCells (padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    // configure dimesions and number of items per row
    open func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, itemHeight : CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: itemHeight)
    }
    //
    // configure dimesions and number of items per row
    open func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: collectionViewSize/numberOfItemsPerRow)
    }
    //
    open func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, cellHeight : CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: cellHeight)
    }
}

extension CollectionViewAdapter : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // CollectionView callbacks
    //
    // Configure number of rows/sections
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (mDelegate?.configureNumberOfItemsInSection?(collectionView: collectionView, section: section)) != nil {
            return (mDelegate?.configureNumberOfItemsInSection!(collectionView: collectionView, section: section))!
        }
        else if (collectionViewDataSource != nil && (collectionViewDataSource?.count)! > 0) {
            return (collectionViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (mDelegate?.configureNumberOfSections?(collectionView: collectionView)) ?? 1
    }
    // Configure cell dimensions (width & height)
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (mDelegate?.sizeForItemAtIndexPath?(collectionView: collectionView, collectionViewLayout: collectionViewLayout)) != nil {
            return(mDelegate?.sizeForItemAtIndexPath?(collectionView: collectionView, collectionViewLayout: collectionViewLayout))! }
        return configurePaddingForSquareSizedCells(padding: 25)
    }
    // Configure spacing between row items
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (mDelegate?.spacingBetweenRowItems?(collectionView: collectionView, collectionViewLayout: collectionViewLayout, section: section)) ?? 1
    }
    // Configure spacing between rows
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (mDelegate?.spacingBetweenRows?(collectionView: collectionView, collectionViewLayout: collectionViewLayout, section: section)) ?? 1
    }
    // Configure cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (mDelegate?.configureCollectionViewCell(collectionView: collectionView, cellForRowAt: indexPath))!
    }
    // item did selected at index
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mDelegate?.itemDidSelected?(collectionView: collectionView, indexPath: indexPath)
    }
    
    public func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        mDelegate?.scrollViewAdapterWillEndDragging?(scrollView, withVelocity: velocity, targetContentOffset: targetContentOffset)
    }
    
    public func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        mDelegate?.scrollViewAdapterWillBeginDragging?(scrollView)
    }
    
    // Pagination (Load more)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        mDelegate?.scrollViewAdapterDidEndDragging?(scrollView, willDecelerate: decelerate)
        if (scrollView == mCollectionview) {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= (scrollView.contentSize.height)) {
                //
                if (hasMore) {
                    indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                    indicator?.startAnimating()
                    indicator?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: mCollectionview.bounds.width, height: CGFloat(45))
                    mCollectionview.addSubview(indicator!)
                    hasMore = false
                    mDelegate?.loadMore?(collectionView: mCollectionview, forPage: mCurrentPage, updatedDataSource: collectionViewDataSource)
                }
                else { mDelegate?.noMoreResutlsToLoad?() }
            }
            else { indicator?.stopAnimating() }
        }
        DispatchQueue.main.async {
            self.indicator?.stopAnimating()
        }
    }
}

extension CollectionViewAdapter : EmptyDataSetSource, EmptyDataSetDelegate {
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

