//
//  UIView + Name.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/11/19.
//

extension UIView: LoadableView {}

public protocol LoadableView: class {
    static var name: String { get }
}

public extension LoadableView where Self: UIView {
    static var name: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
