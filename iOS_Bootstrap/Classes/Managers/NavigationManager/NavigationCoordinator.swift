//
//  NavigationCoordinator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

public protocol NavigationCoordinator {
    static var navigationController: UINavigationController? { get set }
    func startInitialView()
}

public extension NavigationCoordinator {
    func startInitialView() {}
}

