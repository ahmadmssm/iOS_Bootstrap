//
//  BaseNavigator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigator: NavigationCoordinator, ContextService {
    
    public static var childCoordinators = [NavigationCoordinator]()
    public var navigationController: UINavigationController? = UINavigationController()
    //
    
    public init() {}
    
    open func getAppWindow() -> UIWindow? { return nil }
    open func getAnimationDuration() -> Double { return 0.3 }
    open func getTransitionAnimation() -> UIView.AnimationOptions {
        return .transitionFlipFromLeft
    }
    open func animateAndOpen(viewController: UIViewController) {
        if (getAppWindow() != nil) {
            let window: UIWindow = getAppWindow()!
            UIView.transition(
                with: window,
                duration: getAnimationDuration(),
                options: getTransitionAnimation(),
                animations: {
                    window.rootViewController = viewController
                    window.makeKeyAndVisible()
            }, completion: nil)
        }
    }
    open func push(viewController: UIViewController,
                         withAnimation: Bool? = true) {
        Self.getContext()
            .navigationController?
            .pushViewController(viewController, animated: withAnimation!)
    }
    open func present(viewController: UIViewController,
                            withAnimation: Bool? = true) {
        Self.getContext()
            .present(viewController, animated: withAnimation!, completion: nil)
    }
    
    open func set(rootViewController viewController: UIViewController) {
        navigationController? = UINavigationController(rootViewController:
            viewController)
    }
    
    open func popOver(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overCurrentContext
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController: viewController)
    }
    
    open func popOver(currentviewController: UIViewController,
                            destinationViewController: UIViewController) {
        destinationViewController.modalPresentationStyle = .overCurrentContext
        destinationViewController.modalTransitionStyle = .crossDissolve
        currentviewController.present(destinationViewController,
                                      animated: true, completion: nil)
    }
    
    open func fullScreenPopOver(viewController: UIViewController) {
        viewController.modalPresentationStyle = .overFullScreen
        viewController.modalTransitionStyle = .crossDissolve
        present(viewController: viewController)
    }
    
    open func fullScreenPopOver(currentviewController: UIViewController,
                                      destinationViewController: UIViewController) {
        currentviewController.modalPresentationStyle = .overFullScreen
        currentviewController.modalTransitionStyle = .crossDissolve
        currentviewController.present(destinationViewController,
                                      animated: true, completion: nil)
    }
    //
    open func startInitialViewController() {}
}
