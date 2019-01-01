//
//  DateTimeHelpers.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

struct DateTimeHelpers {
    
    private static let formatter = DateFormatter()

    static func getCurrentDate() -> Date {
        let date = Date()
        formatter.dateFormat = Constants.targetDateForamt
        return date
    }
    
    static func getCurrentDate() -> String {
        let dateString = formatter.string(from: getCurrentDate())
        return dateString
    }
    
    static func formatDate(date: Date) -> Date? {
        let dateString = date.toString(format: .custom(Constants.targetDateForamt))
        return Date(fromString: dateString, format: .custom(Constants.targetDateForamt))
    }
    
    static func getDateStringFromDate(date: Date) -> String? {
        return date.toString(format: .custom(Constants.targetDateForamt))
    }
    
    static func getDateFromDateString(dateString: String) -> Date? {
        return Date(fromString: dateString, format: .custom(Constants.serverDateFormat))
    }
    
    static func formatDateString(dateString: String) -> String? {
        let date = Date(fromString: dateString, format: .custom(Constants.serverDateFormat))
        return date!.toString(format: .custom(Constants.targetDateForamt))
    }
    
}
