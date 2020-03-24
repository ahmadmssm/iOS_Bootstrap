//
//  Dialogs.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit.UIAlertController
import UIKit.UIViewController

class Dialogs {

    private var alertController: UIAlertController?
    private weak var viewController: UIViewController?
    public typealias ToDoClosure = (_ title: String, _ details: String) -> Void

    func showDialog(viewController: UIViewController, title: String = "message".localized(), message: String) {
        self.viewController = viewController
        alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController!.addAction(UIAlertAction(title: "ok".localized(), style: .default, handler: nil))
        viewController.present(alertController!, animated: true, completion: nil)
    }

    func showLoading(viewController: UIViewController) {
        self.viewController = viewController
        self.alertController = UIAlertController(title: nil,
                                            message: "loading".localized(),
                                            preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        if #available(iOS 13.0, *) { loadingIndicator.style = .medium }
        else { loadingIndicator.style = .gray }
        loadingIndicator.startAnimating()
        self.alertController!.view.addSubview(loadingIndicator)
        self.viewController?.present(alertController!, animated: true, completion: nil)
    }
    
    private func hideAletDialog() {
        self.viewController?.dismiss(animated: true, completion: nil)
        self.viewController = nil
    }
    
    func hideLoading() {
        hideDialog()
    }

    func hideDialog() {
        hideAletDialog()
    }
    
    func showActionSheet(viewController: UIViewController, title : String?,
                         message: String?,
                         actions : [UIAlertAction]) {
        self.viewController = viewController
        self.alertController = UIAlertController(title: title,
                                                 message: message,
                                                 preferredStyle: .actionSheet)
        if (!actions.isEmpty) {
            for action in actions {
                self.alertController!.addAction(action)
            }
        }
        self.viewController?.present(alertController!, animated: true, completion: nil)
    }
    
    func hideActionSheet() {
        self.hideDialog()
    }
    
    func showCreateToDoAlertDialog(viewController: UIViewController, completion: @escaping ToDoClosure) {
        self.viewController = viewController
        self.alertController = UIAlertController(title: "", message: "", preferredStyle: .alert)
        self.alertController!.addTextField { (textField) in
            textField.placeholder = "Title"
        }
        self.alertController!.addTextField { textField in
            // textField can be customized like this
            textField.placeholder = "Details"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: { _ in
            self.hideAletDialog()
        })
        let createToDoAction = UIAlertAction(title: "Create new ToDo",
                                             style: .default,
                                             handler: { [weak alertController] _ in
            let title = alertController?.textFields![0].text ?? "N/A"
            let details = alertController?.textFields![1].text ?? ""
            completion(title, details)

        })
        // Alert dialog actions
        self.alertController!.addAction(cancelAction)
        self.alertController!.addAction(createToDoAction)
        self.viewController?.present(alertController!, animated: true, completion: nil)
    }
}
