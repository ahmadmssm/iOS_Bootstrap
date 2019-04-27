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
    open class func push(viewController: UIViewController,
                         withAnimation: Bool? = true) {
        getContext()
            .navigationController?
            .pushViewController(viewController, animated: withAnimation!)
    }
    open class func present(viewController: UIViewController,
                            withAnimation: Bool? = true) {
        getContext()
            .present(viewController, animated: withAnimation!, completion: nil)
    }
    open class func set(rootViewController viewController: UIViewController) {
        navigationController? = UINavigationController(rootViewController:
            viewController)
    }
    //
    open class func startInitialViewController() {}
}
