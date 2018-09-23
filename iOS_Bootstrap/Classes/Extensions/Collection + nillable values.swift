//
//  Collection + nillable values.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/23/18.
//

public extension Collection {
    
    /// Returns the element at the specified index iff it is within bounds, otherwise nil.
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
