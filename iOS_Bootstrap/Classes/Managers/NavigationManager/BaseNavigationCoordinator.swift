//
//  BaseNavigationCoordinator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigationCoordinator : Coordinator {
    
    public var childCoordinators = [Coordinator]()
    public var navigationController: UINavigationController?

    public init () {
        // Create the main navigation controller
        navigationController = UINavigationController()
    }
        
}
