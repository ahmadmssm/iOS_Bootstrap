//
//  DateTimeManager.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/17/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import Foundation

open class DateTimeManager {
  
    private let dateFormatter = DateFormatter()
    private let currentDateTime = Date()
    private let userCalendar = Calendar.current

    func getCurrentDateAndTime (pattern : String!)  -> String {
        // dd.MM.yyyy_hh.mm.ss
        if (pattern != nil) {
            dateFormatter.dateFormat = pattern
            return dateFormatter.string(from: currentDateTime)
        }
        return "Invalid pattern !"
    }

    func getCurrentDate(pattern : String!) -> String {
        return getCurrentDateAndTime(pattern: pattern)
    }
    
    // Get current Time in this format : hh:mm:ss
    func getCurrentTime(pattern : String!) -> String {
        return getCurrentDateAndTime(pattern: pattern)
    }

    //
//    func dateFormatter(dateString : String) -> String {
//        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+2:00")
//        let date = dateFormatter.date(from: dateString)
//        print(date ?? "") //Convert String to Date
//        dateFormatter.dateFormat = "EEE, dd MMM yyyy"
//        var newDate = dateFormatter.string(from: date!)
//        dateFormatter.dateFormat = "hh:mm a"
//        newDate = newDate + " at " + dateFormatter.string(from: date!)
//        return newDate
//    }
    //
    
//    func dateAndTimeFromGregorianFormat(dateTime : Date!, timeZone : String!) -> (date : Date, time : Date) {
//        if (dateTime != nil && timeZone != nil) {
//            let dateTimeString : String = dateFormatter.string(from: dateTime)
//            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
//            dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
//            //
//            let mDate : Date = dateFormatter.dateFormat = "yyyy-MM-dd"
//            let date = dateFormatter.date(from: dateTimeString)
//
//            let mTime : Date = dateFormatter.dateFormat = "hh:mm a"
//            //
//            return (mDate, mTime)
//        }
//        return nil
//    }
    
//    func dateAndTimeToGregorianFormat(date : Date!, time : Date!, timeZone : String!) -> String {
//        if (date != nil && time != nil && timeZone != nil) {
//            dateFormatter.timeZone = TimeZone(abbreviation: timeZone)
//            //
//            dateFormatter.dateFormat = "yyyy-MM-dd"
//            // Get date string
//            let dateString : String = dateFormatter.string(from:date)
//            dateFormatter.dateFormat = "HH:mm:ss.SSS'Z'"
//            // Get time string
//            let timeString : String = dateFormatter.string(from:time)
//            //
//            return dateString + "'T'" + timeString
//        }
//        return "Invalid arguments !"
//    }

    // Convert date to this format : yyyy-mm-dd
//    func dateTimeFormatter(dateString : String!) -> String {
//        // dateString = "1-12-2016
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let Date = dateFormatter.date(from:dateString)
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        print("gogor ", dateString)
//        let convertedDate : String! = dateFormatter.string(from: Date!)
//        return convertedDate!
//    }

    // Convert date to this format : yyyy-mm-dd
//    func dateFormatter(dateString : String!) -> String {
//        // dateString = "1-12-2016
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let Date = dateFormatter.date(from:dateString)
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        print("gogor ", dateString)
//        let convertedDate : String! = dateFormatter.string(from: Date!)
//        return convertedDate!
//    }
    
    // Convert date to this format : yyyy-mm-dd
//    func timeFormatter(dateString : String!) -> String {
//        // dateString = "1-12-2016
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        let Date = dateFormatter.date(from:dateString)
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        print("gogor ", dateString)
//        let convertedDate : String! = dateFormatter.string(from: Date!)
//        return convertedDate!
//    }
    
    
//    func getDateString(_ date_time : String) -> String {
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
//        let dateF = dateFormatter.date(from: date_time)
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        print("uuu1 ", dateFormatter.string(from: dateF!))
//        return dateFormatter.string(from: dateF!)
//    }
//    func getTimeString(_ date_time : String) -> String {
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +0000"
//        let timeF = dateFormatter.date(from: date_time)
//        dateFormatter.dateFormat = "hh:mm:ss a"
//        return dateFormatter.string(from: timeF!)
//    }
    
//    func time24To12ConverterWithAm_PM(_ time : String!) -> String {
//        let timeString = time.components(separatedBy: ":")
//        let hours : String = timeString[0]
//        var minuits : String = timeString[1]
//        if minuits.characters.count == 1 {
//            minuits = "0" + minuits
//        }
//        var seconds : String = timeString[2]
//        if seconds.characters.count == 1 {
//            seconds = "0" + seconds
//        }
//        var ap : String = "AM"
//        var hh : Int = Int(hours)!
//        var hur : String = hours
//        if Int(hours)! >= 12 {
//            hh = Int(hours)! - 12
//            if (hh == 0) || (hh == 00) {
//                hh = 12
//                hur = String(hh)
//            }
//            else if (hh < 10) {
//                hur = "0" + String(hh)
//            }
//            ap = "PM"
//        }
//        else if (Int(hours)! < 10) {
//            hur = "0" + hours
//        }
//        else if (Int(hours)! == 0) || (Int(hours)! == 00) {
//            hh = 12
//            hur = String(hh)
//        }
//        return hur + ":" + minuits + ":" + seconds + " " + ap
//    }
    
//    func time12To24Converter(_ time : String) -> String {
//        print("gtgt3", time)
//        dateFormatter.dateFormat = "hh:mm:ss a"
//        let time24 = dateFormatter.date(from: time)
//        dateFormatter.dateFormat = "HH:mm:ss"
//        let time_12 : String! = dateFormatter.string(from: time24!)
//        return time_12!
//    }
//
//    func timeZoneConverter (_ timeZoneString : String, timeString : String) -> String {
//
//        print("mmm ", timeString)
//        // From server : "Etc/GMT-6"
//        // To server : "Etc/GMT+0"
//        let timeConverter : DateFormatter = DateFormatter ()
//        timeConverter.timeZone = TimeZone (identifier: timeZoneString)
//        timeConverter.dateFormat = "hh:mm:ss a"
//        let finalTime: Date = timeConverter.date(from: timeString)!
//        print("conv date", finalTime)
//
//        let comp = (userCalendar as NSCalendar).components([.hour, .minute, .second], from: finalTime)
//        let hour = comp.hour
//        let min = comp.minute
//        let sec = comp.second
//        return String(describing: hour!)+":"+String(describing: min!)+":"+String(describing: sec!)
//    }

    // Date/String conversion
//    func stringToNSDateConverter(_ dateString : String) -> Date {
//
//        print("mmoomm", dateString)
//
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        print("mmoomm2", nsDateToStringConverter(dateFormatter.date(from: dateString)!))
//
//        return dateFormatter.date(from: dateString)!
//    }
//
//    func nsDateToStringConverter(_ date : Date!) -> String {
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        return dateFormatter.string(from: date!)
//    }
    
    
    // Time/String conversion
//    func stringToTimeConverter(_ timeString : String) -> Date {
//        print("ctcc ", timeString)
//        dateFormatter.dateFormat = "HH:mm:ss"
//        return dateFormatter.date(from: timeString)!
//    }
//    func timeToStringConverter(_ date : Date) -> String {
//        dateFormatter.dateFormat = "dd-MM-yyyy"
//        return dateFormatter.string(from: date)
//    }


}
