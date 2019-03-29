//
//  ValidatorsExampleViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ValidatorsExampleViewController:
    BaseViewController<ValidatorsExamplePresenter, ValidatorsExampleViewDelegator> {
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    //
    private var okAction: UIAlertAction!
    
    
    override func initUI() {
        okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            UIAlertAction in
        }
    }
    
    override func localizeStrings() {}
    
    @IBAction func didEndTyping(_ sender: UITextField) {
        switch sender {
        case emailTextField:
            getPresenter().setEmail(email: emailTextField.text!)
        case passwordTextField:
            getPresenter().setPassword(password: passwordTextField.text!)
        default: break
        }
    }
    
    @IBAction func submitButton(_ sender: UIButton) { getPresenter().submit() }
    
}

extension ValidatorsExampleViewController: ValidatorsExampleViewDelegator {
    
    func onInvalidEmail(errorMessage: String) {
        showAlert(title: "Error", message: errorMessage, actions: [okAction])
    }
    
    func onInvalidPassword(errorMessage: String) {
        showAlert(title: "Error", message: errorMessage, actions: [okAction])
    }
    
    func onMisssingValidation() {
        showAlert(title: "Error", message: "Invalid input data !", actions: [okAction])
    }
    
    func onAllValid() { showAlert(title: "", message: "All Valid", actions: [okAction]) }
    
}
