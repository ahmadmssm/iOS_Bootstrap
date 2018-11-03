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
    @objc optional func configureNumberOfItemsInSection(section : Int) -> Int
    @objc optional func itemDidSelected(indexPath : IndexPath)
    @objc optional func didHighlightItemAtIndexPath(indexPath : IndexPath)
    @objc optional func didUnHighlightItemAtIndexPath(indexPath : IndexPath)
    @objc optional func configureAdditionalCollectionViewProperties (collectionView : UICollectionView)
    @objc optional func sizeForItemAtIndexPath (collectionViewLayout: UICollectionViewLayout) -> CGSize
    @objc optional func spacingBetweenRows (collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
    @objc optional func spacingBetweenRowItems (collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
}
