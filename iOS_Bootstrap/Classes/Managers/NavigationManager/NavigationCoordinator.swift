//
//  NavigationCoordinator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

public protocol NavigationCoordinator {
    var navigationController: UINavigationController? { get set }
    func startInitialViewController()
}

public extension NavigationCoordinator {
    func startInitialViewController() {}
}

