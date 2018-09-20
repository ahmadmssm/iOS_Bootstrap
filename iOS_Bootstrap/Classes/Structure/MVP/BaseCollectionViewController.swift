//
//  BaseCollectionViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionViewController <T, D> : BaseViewController<T, D> where T : BasePresenter<D> {
    
    private let collectionViewAdapter : CollectionViewAdapter = CollectionViewAdapter()
    private var collectionViewDataSource : [D] = [D]()
    //
    public final var getCollectionViewAdapter : CollectionViewAdapter { get { return collectionViewAdapter } }
    public var getCollectionViewDataSource : [D] {
        set (newDataSource) { collectionViewDataSource = newDataSource }
        get { return collectionViewDataSource }
    }
}
