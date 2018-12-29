//
//  Helpers.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct Helpers {
    
    private static let formatter = DateFormatter()

    static func getCurrentDate() -> Date {
        let date = Date()
        formatter.dateFormat = "dd/MM/yyyy"
        return date
    }
    
    static func getCurrentDate() -> String {
        let dateString = formatter.string(from: getCurrentDate())
        return dateString
    }
    
}
