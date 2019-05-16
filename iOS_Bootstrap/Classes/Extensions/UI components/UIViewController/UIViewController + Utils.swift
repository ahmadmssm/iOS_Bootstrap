//
//  UIViewController + Utils.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/13/19.
//

public extension UIViewController {
    final func addNavigationBarCustomBackButton(imageButton: UIButton, selector: Selector) {
        imageButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15, bottom: 0, right: 0)
        imageButton.addTarget(self, action: selector, for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: imageButton)
    }
    
    final func addChildViewController(viewController: UIViewController, containerView: UIView) {
        // Add Child View Controller
        addChildViewController(viewController)
        // Add Child View as Subview
        containerView.addSubview(viewController.view)
        // Configure Child View
        viewController.view.frame = containerView.bounds
        // viewController.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        // Notify Child View Controller
        viewController.didMove(toParentViewController: self)
    }
    
    final func removeChildViewController(viewController: UIViewController, containerView: UIView) {
        if (containerView.subviews.contains(viewController.view)) {
            // Notify Child View Controller
            viewController.willMove(toParentViewController: nil)
            // Remove Child View From Superview
            viewController.view.removeFromSuperview()
            // Notify Child View Controller
            viewController.removeFromParentViewController()
        }
    }
}
