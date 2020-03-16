//
//  BaseNavigator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 7/10/18.
//

open class BaseNavigator: NavigationCoordinator {
    
    static var currentViewController: UIViewController?
    public var navigationController: UINavigationController? = UINavigationController()
    
    public init() {}
    
    public func getCurrentViewController() -> UIViewController? { return Self.currentViewController }
    open func getAppWindow() -> UIWindow? { return nil }
    open func getAnimationDuration() -> Double { return 0.3 }
    open func getTransitionAnimation() -> UIView.AnimationOptions { return .transitionFlipFromLeft }
    open func startInitialViewController() {}

    open func animateAndOpen(targetViewController: UIViewController) {
        if (getAppWindow() != nil) {
            let window: UIWindow = getAppWindow()!
            UIView.transition(
                with: window,
                duration: getAnimationDuration(),
                options: getTransitionAnimation(),
                animations: {
                    window.rootViewController = targetViewController
                    window.makeKeyAndVisible()
            }, completion: nil)
        }
    }
    
    open func push(currentViewController: UIViewController,
                   targetViewController: UIViewController,
                   withAnimation: Bool? = true) {
        currentViewController
            .navigationController?
            .pushViewController(targetViewController, animated: withAnimation!)
    }
    
    open func present(currentViewController: UIViewController,
                      targetViewController: UIViewController,
                      withAnimation: Bool? = true) {
        currentViewController.present(targetViewController, animated: withAnimation!, completion: nil)
    }
    
    open func set(rootViewController viewController: UIViewController) {
        navigationController? = UINavigationController(rootViewController:
            viewController)
    }
    
//    open func popOver(currentViewController: UIViewController = getCurrentViewController(),
//                      targetViewController: UIViewController) {
//        currentViewController.modalPresentationStyle = .overCurrentContext
//        currentViewController.modalTransitionStyle = .crossDissolve
//        present(currentViewController: currentViewController, targetViewController: targetViewController)
//    }
//    
//    open func fullScreenPopOver(currentviewController: UIViewController = getCurrentViewController(),
//                                destinationViewController: UIViewController) {
//        currentviewController.modalPresentationStyle = .overFullScreen
//        currentviewController.modalTransitionStyle = .crossDissolve
//        currentviewController.present(destinationViewController,
//                                      animated: true, completion: nil)
//    }
}
