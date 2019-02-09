//
//  CustomObjectValidationTarget.swift
//  AFDateHelper
//
//  Created by Ahmad Mahmoud on 2/9/19.
//

open class CustomObjectValidationTarget<T: Any>: ObjectValidator<T> {
    
    override public func validate(_ value: T?) throws {
        if (value == nil) {
            throw RxValidatorResult.notValidWithCode(code: 1001)
        }
    }
}
