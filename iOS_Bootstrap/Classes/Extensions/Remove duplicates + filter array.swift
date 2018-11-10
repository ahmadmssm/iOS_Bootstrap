//
//  Remove duplicates + filter array.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/10/18.
//
//  Ref : https://stackoverflow.com/questions/25738817/removing-duplicate-elements-from-an-array


import Foundation

public extension Array where Element:Equatable {
    
    public func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
    
    public func filterDuplicates( includeElement: (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element]{
        var results = [Element]()
        forEach { (element) in
            let existingElements = results.filter {
                return includeElement(element, $0)
            }
            if existingElements.count == 0 {
                results.append(element)
            }
        }
        return results
    }
}

/*
 
 How to use :
 
 let arrayOfInts = [2, 2, 4, 4]
 
 Remove duplicates :
 print(arrayOfInts.removeDuplicates()) // Prints: [2, 4]
 
 Filtering based on properties :
 let filteredElements = myElements.filterDuplicates { $0.PropertyOne == $1.PropertyOne && $0.PropertyTwo == $1.PropertyTwo }
 
 */

