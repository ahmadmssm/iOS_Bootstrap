//
//  ArrayExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/5/19.
//

import Foundation

// Clonable
public extension Array where Element: Clonable {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.clone())
        }
        return copiedArray
    }
}

// Remove multiple indices
public extension Array {
    mutating func remove(at indexs: [Int]) {
        guard !isEmpty else { return }
        let newIndexs = Set(indexs).sorted(by: >)
        newIndexs.forEach {
            guard $0 < count, $0 >= 0 else { return }
            remove(at: $0)
        }
    }
}


//  Ref : https://stackoverflow.com/questions/25738817/removing-duplicate-elements-from-an-array
// Remove duplicates + Filter array
public extension Array where Element:Equatable {
    func removeDuplicates() -> [Element] {
        var result = [Element]()
        for value in self {
            if result.contains(value) == false {
                result.append(value)
            }
        }
        return result
    }
    
    func filterDuplicates( includeElement: (_ lhs:Element, _ rhs:Element) -> Bool) -> [Element]{
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
    
    /*
    
    How to use :
    
    let arrayOfInts = [2, 2, 4, 4]
    
    Remove duplicates :
    print(arrayOfInts.removeDuplicates()) // Prints: [2, 4]
    
    Filtering based on properties :
    let filteredElements = myElements.filterDuplicates { $0.PropertyOne == $1.PropertyOne && $0.PropertyTwo == $1.PropertyTwo }
    
    */
}

