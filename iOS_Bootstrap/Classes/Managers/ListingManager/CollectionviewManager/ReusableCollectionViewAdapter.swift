//
//  ReusableCollectionViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/2/18.
//

import Foundation

open class ReusableCollectionViewAdapter : NSObject, BaseCollectionViewDelegates {
    
    private final var mCollectionview : UICollectionView!
    private final var mCollectionViewDataSource: [Any]!
    //
    private final var nibClass : BaseCollectionViewCell.Type!
    fileprivate final var mDelegate : BaseCollectionViewDelegates!
    //
    private final var adapter : CollectionViewAdapter!
    
    required public init(collectionView : UICollectionView!, dataSource: [Any]!) {
        super.init()
        //
        self.mCollectionview = collectionView
        self.mCollectionViewDataSource = dataSource
        self.mDelegate = self
        //
        configureReusableCollectionView(collectionViewDataSource: mCollectionViewDataSource)
        //
        if ((mCollectionview != nil) &&
            (mCollectionViewDataSource != nil) &&
            (nibClass != nil) &&
            (mDelegate != nil)) {
            adapter = CollectionViewAdapter()
            adapter.configureCollectionviewWithXibCell(collectionView: mCollectionview, dataSource: mCollectionViewDataSource, nibClass: nibClass, delegate: mDelegate)
        }
    }
    
    open func configureCollectionViewCell(collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : BaseCollectionViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        return cell
    }
    
    public final func configurePaginationParameters(totalNumberOfItems : Int, itemsPerPage : Int) {
        adapter.configurePaginationParameters(totalNumberOfItems: totalNumberOfItems, itemsPerPage: itemsPerPage)
    }
    
//    open func reloadCollectionViewData(pageItems: [Any]!, currentPage: Int) {
//        adapter.reloadCollectionView(pageItems: pageItems, currentPage: currentPage)
//    }
    
    open func reloadCollectionViewData(pageItems: [Any]!) {
        adapter.reloadCollectionView(pageItems: pageItems)
    }
    
    open func configureReusableCollectionView(collectionViewDataSource: [Any]!)  {}
    
}

