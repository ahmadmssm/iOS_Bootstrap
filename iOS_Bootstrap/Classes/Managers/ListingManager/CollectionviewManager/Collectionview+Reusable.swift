//
//  Collectionview+Reusable.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation
import UIKit

public extension UICollectionView {
    
    func registerCell<T: UICollectionViewCell>(cellClass: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: cellClass.self)
        let cellClassName: String = String(describing: cellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: bundle)
        register(nib, forCellWithReuseIdentifier: cellClassName)
    }
    
    func registerHeaderCell<T: UICollectionReusableView>(headerClass: T.Type) where T: ReusableCell {
        register(headerClass.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: headerClass.nibName)
    }
    
    func registerFooterCell<T: UICollectionViewCell>(footerClass: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: footerClass.self)
        let nib = UINib(nibName: footerClass.nibName, bundle: bundle)
        register(nib, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: footerClass.nibName)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.dequeueIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
    
    func dequeueReusableHeaderCell<H: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> H where H: ReusableCell  {
        return dequeueReusableHeaderOrFooterCell(kind: UICollectionElementKindSectionHeader, forIndexPath: indexPath)
    }
    
    func dequeueReusableFooterCell<F: UICollectionReusableView>(forIndexPath indexPath: IndexPath) -> F where F: ReusableCell {
        return dequeueReusableHeaderOrFooterCell(kind: UICollectionElementKindSectionFooter, forIndexPath: indexPath)
    }
    
    func dequeueReusableDefaultCell(indexPath: IndexPath) -> UICollectionViewCell {
        return self.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
    }
    
    private func dequeueReusableHeaderOrFooterCell <T: UICollectionReusableView>
        (kind: String, forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: T.dequeueIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
}
