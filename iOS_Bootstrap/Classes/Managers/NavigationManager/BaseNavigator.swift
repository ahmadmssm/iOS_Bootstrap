//
//  BaseNavigator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigator : NavigationCoordinator, ContextService {
    public static var childCoordinators = [NavigationCoordinator]()
    public static var navigationController: UINavigationController? = UINavigationController()
    //
    open class func getAppWindow() -> UIWindow? { return nil }
    open class func getAnimationDuration() -> Double { return 0.3 }
    open class func getTransitionAnimation() -> UIView.AnimationOptions {
        return .transitionFlipFromLeft
    }
    open class func animateAndOpen(viewController: UIViewController) {
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
    
    open class func push(viewController: UIViewController) {
        getContext()
            .navigationController?
            .pushViewController(viewController, animated: true)
    }
    
    open class func present(viewController: UIViewController) {
        getContext().present(viewController, animated: true, completion: nil)
    }
}
