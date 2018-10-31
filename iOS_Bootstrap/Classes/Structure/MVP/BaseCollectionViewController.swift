//
//  BaseCollectionViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionViewController <T, V, D> : BaseViewController<T, V> where T : BasePresenter<V> {
        
    private let collectionViewAdapter : CollectionViewAdapter = CollectionViewAdapter()
    public final var getCollectionViewAdapter : CollectionViewAdapter {
        get { return collectionViewAdapter }
    }
    public var getCollectionViewDataSource : [D] {
        set (dataSource) { return collectionViewAdapter.getDataSource = dataSource}
        get { return collectionViewAdapter.getDataSource as! [D] }
    }


    public final var getTableViewAdapter : CollectionViewAdapter {
        get { return collectionViewAdapter }
    }

    open override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewDataSource : [D] = [D]()
        collectionViewAdapter.setDataSource(dataSource: collectionViewDataSource)
        initCollectionViewAdapterConfiguraton()
    }
    
    open func initCollectionViewAdapterConfiguraton() { fatalError("Must Override") }
    
    public final func initDataSourceIfNeeded(collectionViewDataSource : [D]) {
        collectionViewAdapter.setDataSource(dataSource: collectionViewDataSource)
    }
    
}
