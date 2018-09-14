//
//  BaseCollectionAdapterView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionAdapterView: BaseView {
    private let collectionViewAdapter : CollectionViewAdapter = CollectionViewAdapter()
    public func getCollectionViewAdapter() -> CollectionViewAdapter { return collectionViewAdapter }
}

