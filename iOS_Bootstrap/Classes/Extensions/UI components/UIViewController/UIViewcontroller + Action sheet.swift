//
//  UIViewcontroller + Action sheet.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/7/19.
//


public extension UIViewController {
    public func showActionSheet(title: String,
                                message: String, actions: [(String, UIAlertActionStyle)],
                                completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        self.present(alertViewController, animated: true, completion: nil)
    }
}
