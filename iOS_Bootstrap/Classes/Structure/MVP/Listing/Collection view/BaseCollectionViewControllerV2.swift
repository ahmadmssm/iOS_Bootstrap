//
//  BaseCollectionViewControllerV2.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/28/18.
//

open class BaseCollectionViewControllerV2 <T, V, D, C>:
                            BaseCollectionViewController<T, V, D>
                            where T: BasePresenter<V>, C: BaseCollectionViewCellV2<D> {
    
    public final func initCollectionViewAdapterConfiguraton(collectionView: UICollectionView,
                                                       delegate: BaseCollectionViewDelegates) {
        getCollectionViewAdapter().configureCollectionviewWithXibCell(collectionView: collectionView, nibClass: C.self, delegate: delegate)
    }
    
    open func initCell (indexPath: IndexPath) -> C {
        return initCell(cell: C.self, indexPath: indexPath)
    }
    
}
