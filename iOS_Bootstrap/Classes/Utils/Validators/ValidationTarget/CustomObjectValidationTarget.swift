//
//  CustomObjectValidationTarget.swift
//  AFDateHelper
//
//  Created by Ahmad Mahmoud on 2/9/19.
//

import RxSwift

open class CustomObjectValidationTarget<T: Any>: ValidationTarget {    
    
    public typealias TargetType = T
    public typealias ValidatorType = ObjectValidator<T>
    public var value: TargetType?

    public var result: Observable<TargetType>?
    
    required public init(_ value: TargetType?) {
        if (value != nil) {
            self.value = value
        }
    }
    
    public func validate(_ validator: ObjectValidator<T>?) -> Self {
        do {
            try validator?.validate(value)
        }
        catch {
            result = Observable.error(error)
        }
        return self
    }
    
    public func validate(_ condition: ValidatorInstanceCondition, message: String? = nil) -> Self {
        if !condition(value!) {
        if let msg = message {
            self.result = Observable.error(RxValidatorResult.notValidWithMessage(message: msg))
        } else {
            self.result = Observable.error(RxValidatorResult.notValid)
        }
    }
    return self
    }
    
}
