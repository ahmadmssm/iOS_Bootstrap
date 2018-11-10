//
//  Navigator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class Navigator: BaseNavigator {
    //
    private static let mainStoryboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
    //
    static func startInitialView() {
        let mainViewController : MainViewController = mainStoryboard.instantiateViewController()
        navigationController? = UINavigationController(rootViewController: mainViewController)
        let window : UIWindow = AppDelegate.getAppWindow()
        //
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionFlipFromLeft,
            animations: {
                window.rootViewController = navigationController
        }, completion: nil)
    }
    //
    static func goToSideMenuStoryboard() {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.menu)
        let mainViewController : TrendingMoviesViewController = storyboard.instantiateViewController()
        let sideMenuViewController : SideMenuViewController = storyboard.instantiateViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: mainViewController)
        // Set the main menu view controller
        sideMenuViewController.mainViewController = mainViewController
        // Add rignt and/or left menu (We can add 2 different menues for right and left sides).
        let slidingMenu = MySlidingMenu ( mainViewController:navigationController, leftMenuViewController: sideMenuViewController)
        // getContext().navigationController?.pushViewController(slidingMenu, animated: true)
        getContext().present(slidingMenu, animated: true, completion: nil)
    }
    //
    static func goToCountryDetailsViewController(country : Country) {
      //  let countryDetailsViewController = mainStoryboard.instantiateViewController() as TableExampleView
      //  getContext().navigationController?.pushViewController(vc, animated: false)
    }
    
    static func goToViewController() {
        let viewController : CustomViewsViewController = mainStoryboard.instantiateViewController()
        getContext().navigationController?.pushViewController(viewController, animated: false)
    }
    
}
