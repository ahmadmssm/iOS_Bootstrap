//
//  NumberShouldEqualTo.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

public final class NumberShouldEqualTo<T: Numeric>: NumberValidator<T> {
    let number: T

    public init(_ number: T) {
        self.number = number
    }
    override public func validate(_ value: T) throws {
        if value != number {
            throw RxValidatorResult.notEqualNumber
        }
    }
}

extension NumberValidator {
    public static func shouldEqualTo(_ number: T) -> NumberValidator<T> {
        return NumberShouldEqualTo<T>(number)
    }
}
