//
//  BaseCollectionViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionViewController <T, V, D> : BaseViewController<T, V> where T : BasePresenter<V> {
        
    private let collectionViewAdapter : CollectionViewAdapter = CollectionViewAdapter()
    
     public final func getCollectionViewAdapter() -> CollectionViewAdapter {
        return collectionViewAdapter
    }

    public final var getCollectionViewDataSource : [D] {
        get { return collectionViewAdapter.getDataSource() as! [D] }
    }
    
    public final func setDataSource(datasource : [D]) {
        collectionViewAdapter.setDataSource(dataSource: datasource)
    }
    open override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewDataSource : [D] = [D]()
        collectionViewAdapter.setDataSource(dataSource: collectionViewDataSource)
        initCollectionViewAdapterConfiguraton()
    }
    
    open func initCollectionViewAdapterConfiguraton() { fatalError("Must Override") }
    
    public final func initDataSourceIfNeeded(collectionViewDataSource : [D]) {
        setDataSource(datasource: collectionViewDataSource)
    }
    
}
