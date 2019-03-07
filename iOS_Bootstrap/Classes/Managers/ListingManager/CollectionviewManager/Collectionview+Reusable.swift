//
//  Collectionview+Reusable.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
//    public func register<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableCell {
//        register(cellClass, forCellWithReuseIdentifier: String(describing: cellClass.self))
//    }
    
    public func registerCell<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: cellClass.self)
        let cellClassName: String = String(describing: cellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cellClassName)
    }
    
    public func registerHeaderCell<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: cellClass.self)
        let cellClassName: String = String(describing: cellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: cellClassName)
    }
    
    public func registerFooterCell<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: cellClass.self)
        let cellClassName: String = String(describing: cellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: cellClassName)
    }
    
    public func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.dequeueIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
    
    public func dequeueReusableHeaderCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        return dequeueReusableHeaderOrFooterCell(viewForSupplementaryElementOfKind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
    }
    
    public func dequeueReusableFooterCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        return dequeueReusableHeaderOrFooterCell(viewForSupplementaryElementOfKind: UICollectionElementKindSectionFooter, forIndexPath: indexPath)
    }
    
    private func dequeueReusableHeaderOrFooterCell<T: UICollectionViewCell>(viewForSupplementaryElementOfKind: String, forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableSupplementaryView(ofKind: viewForSupplementaryElementOfKind, withReuseIdentifier: T.dequeueIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
    
}
