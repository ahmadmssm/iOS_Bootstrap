//
//  DateShouldEqualTo.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

import Foundation

open class DateShouldEqualTo: DateValidator {
    let date: Date

    public init(_ date: Date) {
        self.date = date
    }
    override public func validate(_ value: Date, granularity: Calendar.Component) throws {
        let calendar = Calendar(identifier: .gregorian)
        let result = calendar.compare(value, to: date, toGranularity: granularity)

        if result != .orderedSame {
            throw RxValidatorResult.notEqualDate
        }
    }
}

extension DateValidator {
    public static func shouldEqualTo(_ date: Date) -> DateValidator {
        return DateShouldEqualTo(date)
    }
}
