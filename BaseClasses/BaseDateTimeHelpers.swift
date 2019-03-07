//
//  BaseDateTimeHelpers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/7/19.
//


open class BaseDateTimeHelpers {
    
    private static let formatter = DateFormatter()
    
    open class func getCurrentDate(desiredFormat: String) -> Date {
        let date = Date()
        formatter.dateFormat = desiredFormat
        return date
    }
    
    open class func formatDate(date: Date, desiredFormat: String) -> Date? {
        let dateString = date.toString(format: .custom(desiredFormat))
        return Date(fromString: dateString, format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open class func getDateStringFromDate(date: Date, desiredFormat: String) -> String? {
        return date.toString(format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open class func getDateStringFromDateWithCustomFormat(format: String, date: Date) -> String? {
        return date.toString(format: .custom(format), timeZone: .utc)
    }
    
    open class func getDateFromDateString(dateString: String, desiredFormat: String) -> Date? {
        return Date(fromString: dateString, format: .custom(desiredFormat), timeZone: .utc)
    }
    
    open class func getDateFromDateStringWithFormat(format: String, dateString: String) -> Date? {
        return Date(fromString: dateString, format: .custom(format), timeZone: .utc)
    }
    
    open class func formatDateString(dateString: String,
                                     fromFormat: String,
                                     toFormat: String) -> String? {
        let date = Date(fromString: dateString, format: .custom(fromFormat))
        return date!.toString(format: .custom(toFormat), timeZone: .utc)
    }
    
}
