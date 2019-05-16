//
//  UIViewController +  LoadNib.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

public extension UIViewController {
    func loadFromNib<T: UIViewController>(nib: T) {
        Bundle.main.loadNibNamed(nib.className, owner: self, options: nil)
    }
    
    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
}
