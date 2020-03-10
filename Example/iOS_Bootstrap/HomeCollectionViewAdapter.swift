//
//  HomeCollectionViewAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class HomeCollectionViewAdapter: BaseCollectionViewAdapter<UICollectionView, String> {
    
    private var mainCollectionViewDelegate: HomeCollectionViewDelegate!
    
    convenience init(collectionView: UICollectionView,
                     dataSource: [String],
                     mainCollectionViewDelegate: HomeCollectionViewDelegate) {
        self.init(collectionView: collectionView, xibCell: HomeCollectionViewCell.self)
        self.mainCollectionViewDelegate = mainCollectionViewDelegate
        super.reloadSinglePageCollectionView(items: dataSource)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return initCell(cell: HomeCollectionViewCell.self, indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewSize = collectionView.frame.size.width - 25
        return CGSize(width: collectionViewSize/2, height: collectionViewSize/2)
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainCollectionViewDelegate.didSelectItem(indexPath: indexPath)
    }
}

