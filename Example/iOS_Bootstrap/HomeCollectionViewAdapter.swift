//
//  HomeCollectionViewAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class HomeCollectionViewAdapter: BaseCollectionViewAdapter<UICollectionView, String> {
    
    private weak var homeCollectionViewDelegate: HomeCollectionViewDelegate!
    
    convenience init(collectionView: UICollectionView,
                     dataSource: [String],
                     homeCollectionViewDelegate: HomeCollectionViewDelegate) {
        self.init(collectionView: collectionView, xibCell: HomeCollectionViewCell.self)
        self.homeCollectionViewDelegate = homeCollectionViewDelegate
        collectionView.contentInset = UIEdgeInsets(top: 25, left: 20, bottom: 0, right: 20)
        super.reloadSinglePageCollectionView(items: dataSource)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return initCell(cell: HomeCollectionViewCell.self, indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewCalculatedWidth = collectionView.frame.size.width - 75
        return CGSize(width: collectionViewCalculatedWidth/2, height: 230)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeCollectionViewDelegate.didSelectItem(indexPath: indexPath)
    }
}

