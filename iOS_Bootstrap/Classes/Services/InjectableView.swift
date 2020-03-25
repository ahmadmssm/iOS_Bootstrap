//
//  InjectableView.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/16/20.
//

public protocol InjectableView {
    func setCurrent(viewController: UIViewController?)
}

public extension InjectableView {
    func setCurrent(viewController: UIViewController?) {
        BaseNavigator.currentViewController = viewController
    }
}
