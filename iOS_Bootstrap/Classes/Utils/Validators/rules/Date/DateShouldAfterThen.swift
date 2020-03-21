//
//  DateShouldAfterThen.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

import Foundation

open class DateShouldAfterThen: DateValidator {
    public let date: Date

    public init(_ date: Date) {
        self.date = date
    }
    override public func validate(_ value: Date, granularity: Calendar.Component) throws {
        let calendar = Calendar(identifier: .gregorian)
        let result = calendar.compare(value, to: date, toGranularity: granularity)

        if result != .orderedDescending {
            throw RxValidatorResult.notAfterDate
        }
    }
}

extension DateValidator {
    public static func shouldAfterThen(_ date: Date) -> DateValidator {
        return DateShouldAfterThen(date)
    }
}
