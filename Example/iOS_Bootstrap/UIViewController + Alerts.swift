//
//  UIViewController + Alerts.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/22/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit

extension UIViewController {
    func showSuccess(message: String) {
        let alert = UIAlertController(title: "success".localized(), message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showError(errorMessage: String) {
        let alert = UIAlertController(title: "error".localized(), message: errorMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showWarning(warningMessage: String) {
        let alert = UIAlertController(title: "warning".localized(), message: warningMessage, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func showInfo(message: String) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
