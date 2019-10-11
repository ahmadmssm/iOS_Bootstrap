//
//  UIDevice + Device family.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/12/19.
//

public extension UIDevice {
    static func isXFamilyDevice() -> Bool {
        return UIDevice.modelName.contains("X") || UIDevice.modelName.contains("11")
    }
    
    static func isSEFamilyDevice() -> Bool {
        return UIDevice.modelName.contains("SE")
    }
    
    static func isPlusFamilyDevice() -> Bool {
        return UIDevice.modelName.contains("Plus")
    }
}
