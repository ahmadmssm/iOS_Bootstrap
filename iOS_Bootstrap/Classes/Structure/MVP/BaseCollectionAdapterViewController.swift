//
//  BaseCollectionAdapterViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionAdapterViewController <T, D> : BaseViewController<T, D> where T : BasePresenter<D> {
    private let collectionViewAdapter : CollectionViewAdapter = CollectionViewAdapter()
    public func getCollectionViewAdapter() -> CollectionViewAdapter { return collectionViewAdapter }
}
