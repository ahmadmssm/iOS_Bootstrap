//
//  UIView + Name.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/11/19.
//

public extension
LoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}

public protocol LoadableView: class {
    static var name: String { get }
}
