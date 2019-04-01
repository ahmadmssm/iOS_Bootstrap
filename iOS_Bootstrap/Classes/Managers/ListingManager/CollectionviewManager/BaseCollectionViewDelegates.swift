//
//  CollectionviewDelegates.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/12/18.
//

public protocol BaseCollectionViewDelegates : CollectionViewOptionalDelegates {
    func configureCollectionViewCell (collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
}

@objc public protocol  CollectionViewOptionalDelegates : CommonListingDelegates {
    @objc optional func configureNumberOfItemsInSection(collectionView: UICollectionView, section : Int) -> Int
    @objc optional func itemDidSelected(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func didHighlightItemAtIndexPath(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func didUnHighlightItemAtIndexPath(collectionView: UICollectionView, indexPath : IndexPath)
    @objc optional func configureAdditionalCollectionViewProperties (collectionView : UICollectionView)
    @objc optional func spacingBetweenRows (collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
    @objc optional func spacingBetweenRowItems (collectionView: UICollectionView, collectionViewLayout: UICollectionViewLayout, section: Int) -> CGFloat
    @objc optional func configureNumberOfSections(collectionView: UICollectionView) -> Int
    @objc optional func loadMore (collectionView: UICollectionView, forPage page : Int, updatedDataSource : [Any])
    @objc optional func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    @objc optional func collectionViewAdapter(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets
    @objc optional func collectionViewAdapter(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize
    @objc optional func collectionView(_ collectionView: UICollectionView,
                               layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAt indexPath: IndexPath) -> CGSize
}
