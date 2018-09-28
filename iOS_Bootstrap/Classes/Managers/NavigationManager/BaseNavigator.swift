//
//  BaseNavigator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigator : Coordinator, ContextService {
    public static var childCoordinators = [Coordinator]()
    public static var navigationController: UINavigationController? = UINavigationController()
}
