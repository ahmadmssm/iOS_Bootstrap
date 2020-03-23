//
//  BaseDateTimeUtils.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/8/19.
//

open class BaseDateTimeUtils {
    
    public let formatter = DateFormatter()
    
    public init() {}
    
    open func getCurrentDate(desiredFormat: String) -> Date {
        let date = Date()
        formatter.dateFormat = desiredFormat
        return date
    }
    
    open func formatDate(date: Date, desiredFormat: String) -> Date? {
        let dateString = date.toString(format: .custom(desiredFormat))
        return Date(fromString: dateString, format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open func getDateStringFromDate(date: Date, desiredFormat: String) -> String? {
        return date.toString(format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open func getDateStringFromDateWithCustomFormat(format: String, date: Date) -> String? {
        return date.toString(format: .custom(format), timeZone: .utc)
    }
    
    open func getDateFromDateString(dateString: String, desiredFormat: String) -> Date? {
        return Date(fromString: dateString, format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open func getDateFromDateStringWithFormat(format: String, dateString: String) -> Date? {
        return Date(fromString: dateString, format: .custom(format), timeZone: .utc)
    }
    
    open func formatDateString(dateString: String,
                                     fromFormat: String,
                                     toFormat: String) -> String? {
        let date = Date(fromString: dateString, format: .custom(fromFormat))
        return date!.toString(format: .custom(toFormat), timeZone: .utc)
    }
}
