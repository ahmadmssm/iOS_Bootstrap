//
//  SafeArrayExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 5/3/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

extension Collection where Indices.Iterator.Element == Index {
    subscript (exist index: Index) -> Iterator.Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
