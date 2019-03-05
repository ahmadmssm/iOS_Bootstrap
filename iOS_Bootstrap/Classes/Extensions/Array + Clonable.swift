//
//  Array + Clonable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/5/19.
//

import Foundation

public extension Array where Element: Clonable {
    public func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.clone())
        }
        return copiedArray
    }
}
