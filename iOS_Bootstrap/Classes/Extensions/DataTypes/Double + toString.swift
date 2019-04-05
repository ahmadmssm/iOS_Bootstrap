//
//  Double + toString.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/6/18.
//

public extension Double {
    func toString() -> String { return String(format:"%f", self) }
    
    func toString(withDecimalPoints : Int) -> String {
        let format: String = "%." + String (withDecimalPoints) + "f"
        return String(format: format, self)
    }
}
