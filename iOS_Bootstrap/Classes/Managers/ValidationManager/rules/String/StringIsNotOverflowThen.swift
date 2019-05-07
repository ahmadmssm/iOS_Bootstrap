//
//  StringIsNotOverflowThen.swift
//  RxValidator
//
//  Created by 유금상 on 2018. 5. 30..
//

open class StringIsNotOverflowThen: StringValidator {
    
    public let maxLength: Int
    
    public init(maxLength: Int) {
        self.maxLength = maxLength
    }
    
    override public func validate(_ value: String?) throws {
        if (value == nil) {
            throw RxValidatorResult.nilObject
        }
        else if value!.count > maxLength {
            throw RxValidatorResult.stringIsOverflow
        }
    }
}

extension StringValidator {
    public static func isNotOverflowThen(max length: Int) -> StringValidator {
        return StringIsNotOverflowThen(maxLength: length)
    }
}
