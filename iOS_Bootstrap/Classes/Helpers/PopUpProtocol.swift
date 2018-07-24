//
//  PopUpProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/17/18.
//

import Foundation

public protocol PopUpProtocol {}
extension PopUpProtocol where Self: UIViewController {
    //
    func showAlert(title : String, message: String, actions : [UIAlertAction]) {
        let alert = UIAlertController (
            title: title,
            message: message,
            preferredStyle: UIAlertControllerStyle.alert)
        if (!actions.isEmpty) {
            for action in actions {
                alert.addAction(action)
            }
        }
        self.present(alert, animated: true, completion: nil)
    }
    //
    func showActionSheet(title : String, message: String, actions : [UIAlertAction]) {
        let actionSheet = UIAlertController(
            title: title,
            message: message, preferredStyle: .actionSheet)
        if (!actions.isEmpty) {
            for action in actions {
                actionSheet.addAction(action)
            }
        }
        self.present(actionSheet, animated: true, completion: nil)
    }
    
}
