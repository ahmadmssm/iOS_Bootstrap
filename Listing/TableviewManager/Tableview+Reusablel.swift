//
//  TableviewReusablecell.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit 

// MARK: - Table View Registration and Dequeue
public extension UITableView {
    /// Register a cell from external xib into a table instance.
    ///
    /// - Parameter _: cell class
    public func register<T: UITableViewCell>(_: T.Type) where T: ReusableCell {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.dequeueNibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.dequeueIdentifier)
    }
    
    /// Dequeue a cell instance strongly typed.
    ///
    /// - Parameter indexPath: index path
    /// - Returns: instance
    public func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableCell {
        guard let cell = dequeueReusableCell(withIdentifier: T.dequeueIdentifier, for: indexPath as IndexPath) as? T else {
            fatalError("Cannot dequeue: \(T.self) with identifier: \(T.dequeueIdentifier)")
        }
        return cell
    }
}
