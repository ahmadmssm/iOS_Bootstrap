//
//  UIViewControllerExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/10/20.
//

import UIKit

// LoadFromNib
extension UIViewController: INibLoader {}

public protocol INibLoader {
    static func initFromNib<T: UIViewController>() -> T
}

public extension INibLoader {
    static func initFromNib<T: UIViewController>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

// Classs name
public extension UIViewController {
    var className : String { return String(describing: self.classForCoder) }
}

// Connect next field
public extension UIViewController {
    func connectFields(fields:[UITextField]) -> Void {
        guard let last = fields.last else { return }
        for i in 0 ..< fields.count - 1 {
            if fields[i].keyboardType == .decimalPad || fields[i].keyboardType == .numberPad || fields[i].keyboardType == .phonePad {
                fields[i].returnKeyType = .next
                fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: UIControl.Event.editingDidEnd)
            }
            else {
                fields[i].returnKeyType = .next
                fields[i].addTarget(fields[i+1], action: #selector(UIResponder.becomeFirstResponder), for: .editingDidEndOnExit)
            }
        }
        if last.keyboardType == .decimalPad || last.keyboardType == .numberPad || last.keyboardType == .phonePad {
            last.returnKeyType = .go
        }
        else {
            last.returnKeyType = .done
            last.addTarget(last, action: #selector(UIResponder.resignFirstResponder), for: .editingDidEndOnExit)
        }
    }
}

// Load from Nib
public extension UIViewController {
    func loadFromNib<T: UIViewController>(nib: T) {
        Bundle.main.loadNibNamed(nib.className, owner: self, options: nil)
    }
    
    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
}

// Navigation bar
public extension UIViewController {
    func hideNavigationBar() {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setTransparentNavigationbar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}

