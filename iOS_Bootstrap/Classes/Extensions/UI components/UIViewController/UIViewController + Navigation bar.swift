//
//  UIViewController + Navigation bar.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/10/18.
//


public extension UIViewController {
    func hideNavigationBar() {
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    func showNavigationBar() {
        // Show the navigation bar on other view controllers
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func setTransparentNavigationbar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.view.backgroundColor = .clear
    }
}
