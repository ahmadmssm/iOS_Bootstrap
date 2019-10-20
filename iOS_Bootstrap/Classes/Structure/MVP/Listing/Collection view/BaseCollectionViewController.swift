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
        get { return collectionViewAdapter.getDataSource as! [D] }
    }
    
    public final func setDataSource(datasource : [D]) {
        collectionViewAdapter.setDataSource(dataSource: datasource)
    }
    open override func viewDidLoad() {
        super.viewDidLoad()
        let collectionViewDataSource : [D] = [D]()
        collectionViewAdapter.setDataSource(dataSource: collectionViewDataSource)
        initCollectionViewAdapterConfiguraton()
        listenForCollectionViewCellItemsClickEvent()
    }
    
    open func initCollectionViewAdapterConfiguraton() { fatalError("Must Override") }
    
    open func listenForCollectionViewCellItemsClickEvent() {}
    
    public final func initDataSourceIfNeeded(collectionViewDataSource : [D]) {
        setDataSource(datasource: collectionViewDataSource)
    }
    
    open func initCell <C: BaseCollectionViewCellV2<D>>(cell: C.Type, indexPath: IndexPath) -> C {
        let cell: C = getCollectionViewAdapter().getTCollectionView().dequeueReusableCell(forIndexPath: indexPath)
        if (getCellModel(indexPath: indexPath) != nil) {
            cell.cellModel = getCellModel(indexPath: indexPath)
        }
        return cell
    }
    
    open func initHeaderCell <H: BaseCollectionViewHeaderOrFooter>(indexPath: IndexPath) -> H {
        let headerCell: H =
            getCollectionViewAdapter()
                .getTCollectionView()
                .dequeueReusableHeaderCell(forIndexPath: indexPath)
        return headerCell
    }
    
    //        if (getCellModel(indexPath: indexPath) != nil) {
    //           // headerCell.cellModel = getCellModel(indexPath: indexPath)
    //        }
    
    open func initHeaderCell <M, H: BaseCollectionViewHeader<M>>(cellModel: M, indexPath: IndexPath) -> H {
        let headerCell: H = initHeaderCell(indexPath: indexPath)
        headerCell.cellModel = cellModel
        return headerCell
    }
    
    open func initFooterCell <F: BaseCollectionViewHeaderOrFooter>(indexPath: IndexPath) -> F {
        let footerCell: F =
            getCollectionViewAdapter()
                .getTCollectionView()
                .dequeueReusableFooterCell(forIndexPath: indexPath)
        return footerCell
    }
    
    open func initFooterCell <M, F: BaseCollectionViewFooter<M>>(cellModel: M, indexPath: IndexPath) -> F {
        let footerCell: F = initFooterCell(indexPath: indexPath)
        footerCell.cellModel = cellModel
        return footerCell
    }

    open func getCellModel(indexPath: IndexPath) -> D? {
        if let cellModel = getCollectionViewDataSource[exist: indexPath.row] {
            return cellModel
        }
        return nil
    }
}
