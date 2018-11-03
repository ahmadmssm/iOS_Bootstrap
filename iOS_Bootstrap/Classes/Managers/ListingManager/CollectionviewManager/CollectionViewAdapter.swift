//
//  CollectionViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//

import UIKit

open class CollectionViewAdapter : NSObject {
    
    private final var mCollectionview : UICollectionView!
    private final var collectionViewDataSource: [Any]!
    private final var mNibClass : BaseCollectionViewCell.Type!
    fileprivate final var mDelegate : BaseCollectionViewDelegates!
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
    
    public final func getDataSource() -> [Any] {
        if (collectionViewDataSource != nil) { return collectionViewDataSource }
        return []
    }

    public final func setDataSource (dataSource: [Any]) {
        self.collectionViewDataSource = dataSource
    }
    
    public final func configureCollectionviewWithXibCell (collectionView: UICollectionView,
                                                 dataSource: [Any]!,
                                                 nibClass : BaseCollectionViewCell.Type!,
                                                 delegate : BaseCollectionViewDelegates) {
        //
        self.mNibClass = nibClass
        mCollectionview?.register(cellClass: mNibClass.self)
        configureCollectionView(collectionView: collectionView, dataSource: dataSource, delegate: delegate)
    }
    
    public final func configureCollectionviewWithXibCell (collectionView: UICollectionView,
                                                          nibClass : BaseCollectionViewCell.Type!,
                                                          delegate : BaseCollectionViewDelegates) {
        //
        self.mNibClass = nibClass
        mCollectionview?.register(cellClass: mNibClass.self)
        configureCollectionView(collectionView: collectionView, dataSource: [], delegate: delegate)
    }
    
    public final func configureCollectionviewWithStoryboardCell (collectionView: UICollectionView,
                                                        dataSource: [Any],
                                                        nibClass : BaseCollectionViewCell.Type!,
                                                        delegate : BaseCollectionViewDelegates) {
        //
        configureCollectionView(collectionView: collectionView, dataSource: dataSource, delegate: delegate)
    }
    
    private final func configureCollectionView (collectionView: UICollectionView,
                                       dataSource: [Any],
                                       delegate : BaseCollectionViewDelegates) {
        // self.collectionViewDataSource = dataSource
        setDataSource(dataSource: dataSource)
        self.mCollectionview = collectionView
        self.mDelegate = delegate
        //
        mCollectionview?.register(cellClass: mNibClass.self)
        mCollectionview?.dataSource = self
        mCollectionview?.delegate = self
        //
        mCollectionview.emptyDataSetDelegate = self
        mCollectionview.emptyDataSetSource = self
        //
        mDelegate.configureAdditionalCollectionViewProperties?(collectionView: collectionView)
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
        mCollectionview?.addSubview(refreshControl)
    }
    // Pull to refresh action
    @objc private func pullToRefresh (_ refreshControl: UIRefreshControl) {
        mDelegate?.pullToRefresh?(refreshcontrole: refreshControl)
    }
    
    public final func reloadCollectionView(pageItems:[Any]) {
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
        //
        indicator?.stopAnimating()
        self.mCurrentPage += 1
    }
    
    public final func reloadCollectionView() {
        mCollectionview?.reloadData()
    }
    
    // return cells that are square sized
    public func configurePaddingForSquareSizedCells (padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    // configure dimesions and number of items per row
    public func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, itemHeight : CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: itemHeight)
    }
    //
    // configure dimesions and number of items per row
    public func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: collectionViewSize/numberOfItemsPerRow)
    }
    //
    public func configureNumberOfCollectionViewItemsPerRow (numberOfItemsPerRow: CGFloat, cellHeight : CGFloat, padding : CGFloat) -> CGSize {
        let collectionViewSize = mCollectionview.frame.size.width - padding
        return CGSize(width: collectionViewSize/numberOfItemsPerRow, height: cellHeight)
    }
}

extension CollectionViewAdapter : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // CollectionView callbacks
    //
    // Configure number of rows/sections
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (mDelegate?.configureNumberOfItemsInSection?(section: section)) != nil {
            return (mDelegate?.configureNumberOfItemsInSection!(section: section))!
        }
        else if (collectionViewDataSource != nil && (collectionViewDataSource?.count)! > 0) {
            return (collectionViewDataSource?.count)!
        }
        return 0
    }
    // Configure number of sections
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return (mDelegate?.configureNumberOfSections?()) ?? 1
    }
    // Configure cell dimensions (width & height)
    public func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize {
        if (mDelegate?.sizeForItemAtIndexPath?(collectionViewLayout: collectionViewLayout)) != nil {
            return(mDelegate?.sizeForItemAtIndexPath?(collectionViewLayout: collectionViewLayout))! }
        // 2 cells per row
        //
        // let cellWidth = Float(UIScreen.main.bounds.size.width / 2.0)
        // Replace the divisor with the column count requirement. Make sure to have it in float.
        // return CGSize(width: CGFloat(cellWidth), height: CGFloat(cellWidth))
        //
        return configurePaddingForSquareSizedCells(padding: 25)
       // return CGSize(width: 50, height: 50)
    }
    // Configure spacing between row items
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return (mDelegate?.spacingBetweenRowItems?(collectionViewLayout: collectionViewLayout, section: section)) ?? 1
    }
    // Configure spacing between rows
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return (mDelegate?.spacingBetweenRows?(collectionViewLayout: collectionViewLayout, section: section)) ?? 1
    }
    //
//    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//
//        //Where elements_count is the count of all your items in that
//        //Collection view...
//        let cellCount = CGFloat(getDataSource().count)
//
//        //If the cell count is zero, there is no point in calculating anything.
//        if cellCount > 0 {
//            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
//            let cellWidth = flowLayout.itemSize.width + flowLayout.minimumInteritemSpacing
//
//            //20.00 was just extra spacing I wanted to add to my cell.
//            let totalCellWidth = cellWidth*cellCount + 20.00 * (cellCount-1)
//            let contentWidth = collectionView.frame.size.width - collectionView.contentInset.left - collectionView.contentInset.right
//
//            if (totalCellWidth < contentWidth) {
//                //If the number of cells that exists take up less room than the
//                //collection view width... then there is an actual point to centering them.
//
//                //Calculate the right amount of padding to center the cells.
//                let padding = (contentWidth - totalCellWidth) / 2.0
//                return UIEdgeInsetsMake(0, padding, 0, padding)
//            } else {
//                //Pretty much if the number of cells that exist take up
//                //more room than the actual collectionView width, there is no
//                // point in trying to center them. So we leave the default behavior.
//                return UIEdgeInsetsMake(0, 40, 0, 40)
//            }
//        }
//
//        return UIEdgeInsets.zero
//    }
    //
    // Configure cell
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return (mDelegate?.configureCollectionViewCell(collectionView: collectionView, cellForRowAt: indexPath))!
    }
    // item did selected at index
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mDelegate?.itemDidSelected?(indexPath: indexPath)
    }
    
    // Pagination
//    public func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        mDelegate?.loadMore?(forPage: indexPath)
//    }
    
    // Pagination (Load more)
    public func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView == mCollectionview) {
            if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= (scrollView.contentSize.height)) {
                //
                if (hasMore) {
                    indicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
                    indicator?.startAnimating()
                    indicator?.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: mCollectionview.bounds.width, height: CGFloat(45))
                    

                    mCollectionview.addSubview(indicator!)
                //    mCollectionview.tableFooterView = spinner
                //    mCollectionview.tableFooterView?.isHidden = false
                    //
                    hasMore = false
                   // mDelegate?.loadMore?()
                    mDelegate?.loadMore?(forPage: mCurrentPage, updatedDataSource: collectionViewDataSource)
                }
            }
            else {
                indicator?.stopAnimating()
              //  mCollectionview.tableFooterView?.isHidden = true
            }
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

