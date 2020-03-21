//
//  StringIsNotUnderflowThen.swift
//  RxValidator
//
//  Created by Kawoou on 06/10/2018.
//

open class StringIsNotUnderflowThen: StringValidator {
    
    public let minLength: Int

    public init(minLength: Int) {
        self.minLength = minLength
    }

    override public func validate(_ value: String?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if value!.count < minLength {
            throw RxValidatorResult.stringIsUnderflow
        }
    }
}

extension StringValidator {
    public static func isNotUnderflowThen(min length: Int) -> StringValidator {
        return StringIsNotUnderflowThen(minLength: length)
    }
}
