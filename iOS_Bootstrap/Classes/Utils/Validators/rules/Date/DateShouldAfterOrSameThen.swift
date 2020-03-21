//
//  DateShouldAfterOrSameThen.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

import Foundation

open class DateShouldAfterOrSameThen: DateValidator {
    public let date: Date

    public init(_ date: Date) {
        self.date = date
    }
    override public func validate(_ value: Date, granularity: Calendar.Component) throws {
        let calendar = Calendar(identifier: .gregorian)
        let result = calendar.compare(value, to: date, toGranularity: granularity)

        if result == .orderedAscending {
            throw RxValidatorResult.notAfterDate
        }
    }
}

extension DateValidator {
    public static func shouldAfterOrSameThen(_ date: Date) -> DateValidator {
        return DateShouldAfterOrSameThen(date)
    }
}
