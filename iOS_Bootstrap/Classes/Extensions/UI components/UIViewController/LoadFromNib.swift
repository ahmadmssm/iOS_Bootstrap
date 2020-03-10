//
//  LoadFromNib.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/10/20.
//

import UIKit

extension UIViewController: INibLoader {}


public protocol INibLoader {
    static func initFromNib<T: UIViewController>() -> T
}

public extension INibLoader {
    static func initFromNib<T: UIViewController>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}
