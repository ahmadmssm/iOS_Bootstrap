//
//  ValidatorsExamplePresenter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import RxSwift

class ValidatorsExamplePresenter: BasePresenter<ValidatorsExampleViewDelegator> {
    
    private var disposeBag : DisposeBag!
    private var email: String!
    private var password: String!
    private var invalidInputErrorMessage: String!
    // Validation flags
    private var isValidMail: Bool = false
    private var isValidPassword: Bool = false
    
    required init(viewDelegator: ValidatorsExampleViewDelegator) {
        super.init(viewDelegator: viewDelegator)
        disposeBag = DisposeBag ()
        invalidInputErrorMessage = "Input data is not valid !"
    }
    
    deinit { disposeBag = nil }
    
    func setEmail(email: String) {
        Validate.to(email)
            .validate(StringShouldNotBeEmpty())
            .validate(StringShouldBeMatch(RegEx.email.rawValue))
            .asObservable()
            .subscribe(onNext: { emailString in
                self.isValidMail = true
                self.email = emailString
            },
                       onError: { error in
                        self.isValidMail = false
                        self.getViewDelegator().onInvalidEmail(
                            errorMessage: self.handleValidationError(error: error))
            })
            .disposed(by: disposeBag)
    }
    
    func setPassword(password: String) {
        Validate.to(password)
            .validate(StringShouldNotBeEmpty())
            .validate(StringIsNotUnderflowThen(minLength: 8))
            .asObservable()
            .subscribe(onNext: { passwordString in
                self.isValidPassword = true
                self.password = passwordString
            },
                       onError: { error in
                        self.isValidPassword = false
                        self.getViewDelegator().onInvalidPassword(
                                errorMessage: self.handleValidationError(error: error))
            })
            .disposed(by: disposeBag)
    }
    
    private func handleValidationError(error: Error) -> String {
        let validationError = RxValidatorResult.determine(error: error)
        var errorMessage: String = self.invalidInputErrorMessage
        switch validationError {
        case RxValidatorResult.stringIsNotMatch: errorMessage = "Invalid Email !"
        case RxValidatorResult.stringIsEmpty: errorMessage = "Field cannot be empty !"
        case RxValidatorResult.stringIsUnderflow:
            errorMessage = "Passwor length must be at least 8 numbers !"
        default: break
        }
        return errorMessage
    }
    
    func submit() {
        guard isValidMail, isValidPassword  else {
            getViewDelegator().onMisssingValidation()
            return
        }
        getViewDelegator().onAllValid()
    }
    
}
