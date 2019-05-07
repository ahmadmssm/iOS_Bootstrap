//
//  BaseValidator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/7/19.
//

open class BaseValidator {
    
    open class func validate(name: String?) -> Completable {
        return Validate.to(name)
            .validate(StringShouldNotBeEmpty())
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(email: String) -> Completable {
        return Validate.to(email)
            .validate(StringShouldNotBeEmpty())
            .validate(StringShouldBeMatch(RegEx.email.rawValue))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(loginPassword: String) -> Completable {
        return Validate.to(password)
            .validate(StringShouldNotBeEmpty())
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(password: String) -> Completable {
        return Validate.to(password)
            .validate(StringShouldNotBeEmpty())
            .validate(StringIsNotUnderflowThen(minLength: 6))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(confirmPassword: String,
                             originalPassword: String) -> Completable {
        return Validate.to(confirmPassword)
            .validate(StringShouldNotBeEmpty())
            .validate(StringValidator.shouldEqualTo(originalPassword))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(id: Int?) -> Completable {
        return Validate.to(id)
            .validate(NumberValidator.shouldGreaterThan(0))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validateDropDownSelection(selectionId id: Int?,
                                              errorMessage: String) -> Completable {
        return Validate.to(id)
            .validate(DropDownValidator.with(errorMessage: errorMessage))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
    
    open class func validate(number: Int?) -> Completable {
        return Validator.validateId(id: number)
    }
    
    open class func validate<T>(object: T?) -> Completable {
        return Validate.to(object)
            .validate(ObjectValidator.shouldBeNotNil(object))
            .asObservable()
            .asSingle()
            .asCompletable()
    }
}
