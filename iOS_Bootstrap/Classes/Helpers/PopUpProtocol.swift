//
//  PopUpProtocol.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/17/18.
//

import Foundation

private var activityIndicatorAlert: UIAlertController!

public protocol PopUpProtocol {}
public extension PopUpProtocol where Self: UIViewController {
    //
    public func showAlert(title : String, message: String, actions : [UIAlertAction]) {
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
    public func showActionSheet(title : String, message: String, actions : [UIAlertAction]) {
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
    
    public func showLoadingIndicator(message: String) {
      
        activityIndicatorAlert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        loadingIndicator.startAnimating()
        activityIndicatorAlert.view.addSubview(loadingIndicator)
        present(activityIndicatorAlert, animated: true, completion: nil)
    }
    
    public func hideLoadingIndicator() {
        activityIndicatorAlert.dismiss(animated: true, completion: nil)
    }
    
    public func showEZloadinActivity(message : String, cancelable : Bool) {
        EZLoadingActivity.show(message, disableUI: cancelable)
    }
    public func showEZloadinActivityWithDuration(message : String, cancelable : Bool, seconds : Double) {
        EZLoadingActivity.showWithDelay(message, disableUI: cancelable, seconds: seconds)
    }
    public func hideEZloadingActivity() {
        EZLoadingActivity.hide()
    }
    
}
