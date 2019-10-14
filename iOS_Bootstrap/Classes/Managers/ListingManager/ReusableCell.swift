//
//  DequeuableProtocol.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/20/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//
// Ref :
// http://danielemargutti.com/2017/10/08/use-swift-to-make-easy-and-safe-dequeue-operation-in-uitableviewcells/
//
// https://medium.com/@gonzalezreal/ios-cell-registration-reusing-with-swift-protocol-extensions-and-generics-c5ac4fb5b75e
//
// https://gist.github.com/gonzalezreal/92507b53d2b1e267d49a

import Foundation
import UIKit

/// MARK: - This protocol is used to allows cell to be dequeued with strong type
public protocol ReusableCell: class {
    
    /// Return the nib name in which the dequeuable resource is located
    /// You must implement it if your cell is located in a separate xib file
    /// (not for storyboard).
    /// In this case you should call `table.register(CellClass.self)` before
    /// using it in your code.
    /// Default implementation returns the name of the class itself.
    static var dequeueNibName: String { get }
    
    /// This is the identifier used to queue/dequeue the cell.
    /// You don't need to override it; default implementation return the name
    /// of the cell class itself as identifier.
    static var dequeueIdentifier: String { get }
}

// MARK: - Default implementation of the protocol
public extension ReusableCell where Self: UIView {
    
    /// Return the same name of the class with module name as prefix ('MyApp.MyCell')
    static var dequeueIdentifier: String {
      //  return NSStringFromClass(self)
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
    
    /// Return the name of the nib, it return the same name of the cell class itself
    static var dequeueNibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}



