//
//  Collection + nilable values.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 9/23/18.
//

public extension Collection {
    // Returns the element at the specified index if it is within bounds, otherwise nil.
    public subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
