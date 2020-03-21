//
//  NumberShouldLessThan.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

open class NumberShouldLessThan<T: Numeric & Comparable>: NumberValidator<T> {
    
    public let number: T

    public init(_ number: T) {
        self.number = number
    }
    
    override public func validate(_ value: T?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if value! >= number {
            throw RxValidatorResult.notLessThenNumber
        }
    }
}

extension NumberValidator where T: Numeric & Comparable {
    public static func shouldLessThan(_ value: T) -> NumberValidator<T> {
        return NumberShouldLessThan(value)
    }
}
