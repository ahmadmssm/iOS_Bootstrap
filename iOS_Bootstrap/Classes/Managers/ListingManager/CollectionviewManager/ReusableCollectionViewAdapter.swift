//
//  ReusableCollectionViewAdapter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/2/18.
//

import Foundation

open class ReusableCollectionViewAdapter : NSObject {
    
    private final var mCollectionview : UICollectionView!
    private final var mCollectionViewDataSource: [Any]!
    //
    private final var nibClass : BaseCollectionViewCell.Type!
    fileprivate final var mDelegate : CollectionViewDelegates!
    //
    private final var adapter : CollectionViewAdapter!
    
    required public init(collectionView : UICollectionView!, dataSource: [Any]!, delegate : CollectionViewDelegates) {
        super.init()
        //
        self.mCollectionview = collectionView
        self.mCollectionViewDataSource = dataSource
        self.mDelegate = delegate
        //
        configureReusableCollectionView()
        //
        if ((mCollectionview != nil) &&
            (mCollectionViewDataSource != nil) &&
            (nibClass != nil) &&
            (mDelegate != nil)) {
            adapter = CollectionViewAdapter()
            adapter.configureCollectionviewWithXibCell(collectionView: mCollectionview, dataSource: mCollectionViewDataSource, nibClass: nibClass, delegate: mDelegate)
        }
    }
    
    public final func reloadCollectionViewData(dataSource: [Any]!) {
        self.mCollectionViewDataSource = dataSource
        adapter.reloadCollectionView(dataSource: dataSource)
    }
    
    open func configureReusableCollectionView()  {
        // Set tableview cell here
    }
    
}

