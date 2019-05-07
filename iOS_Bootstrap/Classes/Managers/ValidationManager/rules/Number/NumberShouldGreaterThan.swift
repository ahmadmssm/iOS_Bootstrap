//
//  NumberShouldGreaterThan.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

open class NumberShouldGreaterThan<T: Numeric & Comparable>: NumberValidator<T> {
    
    public let number: T
    
    public init(_ number: T) {
        self.number = number
    }
    
    override public func validate(_ value: T?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if value! <= number {
            throw RxValidatorResult.notGreaterThanNumber
        }
    }
}

extension NumberValidator where T: Numeric & Comparable {
    public static func shouldGreaterThan(_ value: T) -> NumberValidator<T> {
        return NumberShouldGreaterThan(value)
    }
}
