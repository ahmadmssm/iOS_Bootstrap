//
//  BaseNavigator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigator : NavigationCoordinator, ContextService {
    public static var childCoordinators = [NavigationCoordinator]()
    public static var navigationController: UINavigationController? = UINavigationController()
}
