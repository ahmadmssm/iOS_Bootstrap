//
//  BaseCollectionViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionViewController <T, D> : BaseViewController<T, D> where T : BasePresenter<D> {
    
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
        initCollectionViewAdapterConfiguraton()
        let collectionViewDataSource : [D] = [D]()
        collectionViewAdapter.setDataSource(dataSource: collectionViewDataSource)
    }
    
    open func initCollectionViewAdapterConfiguraton() { fatalError("Must Override") }
    open func initPaginationParameters() {}
    
}
