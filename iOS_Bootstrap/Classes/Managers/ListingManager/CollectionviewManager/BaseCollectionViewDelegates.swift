//
//  CollectionviewDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//

public protocol BaseCollectionViewDelegates : CollectionViewOptionalDelegates {
    func configureCollectionViewCell (collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell
}

@objc public protocol  CollectionViewOptionalDelegates : CommonListingDelegates {
    @objc optional func configureNumberOfItemsInSection(collectionView: UICollectionView, section : Int) -> Int
    @objc optional func itemDidSelected(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func didHighlightItemAtIndexPath(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func didUnHighlightItemAtIndexPath(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func configureAdditionalCollectionViewProperties (collectionView : UICollectionView)
    @objc optional func sizeForItemAtIndexPath (collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout) -> CGSize
    @objc optional func spacingBetweenRows (collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
    @objc optional func spacingBetweenRowItems (collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
    
    @objc optional func configureNumberOfSections(collectionView: UICollectionView) -> Int
    @objc optional func loadMore (collectionView: UICollectionView, forPage page : Int, updatedDataSource : [Any])
}
