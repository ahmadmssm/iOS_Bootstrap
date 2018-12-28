//
//  BaseCollectionViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/30/18.
//

open class BaseCollectionViewController <T, V, D>: BaseViewController<T, V> where T: BasePresenter<V> {
        
    private let collectionViewAdapter: CollectionViewAdapter = CollectionViewAdapter()
    public var isEmptyDataSource : Bool = false

     public final func getCollectionViewAdapter() -> CollectionViewAdapter {
        return collectionViewAdapter
    }

    public final var getCollectionViewDataSource: [D] {
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
    
    public final func initCell <T: BaseCollectionViewCellV2<D>>(cell: T.Type, indexPath: IndexPath) -> T {
        let cell: T = getCollectionViewAdapter().getTCollectionView().dequeueReusableCell(forIndexPath: indexPath)
        if (getCellModel(indexPath: indexPath) != nil) {
            cell.cellModel = getCellModel(indexPath: indexPath)
        }
        return cell
    }

    private final func getCellModel(indexPath: IndexPath) -> D? {
        if let cellModel = getCollectionViewDataSource[exist: indexPath.row] {
            return cellModel
        }
        return nil
    }
    
}
