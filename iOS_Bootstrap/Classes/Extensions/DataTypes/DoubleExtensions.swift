//
//  DoubleExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/5/19.
//

// isInteger
public extension Double { var isInteger: Bool { return rint(self) == self } }

// To String
public extension Double {
    func toString() -> String { return String(format:"%f", self) }
    
    func toString(withDecimalPoints : Int) -> String {
        let format: String = "%." + String (withDecimalPoints) + "f"
        return String(format: format, self)
    }
}
