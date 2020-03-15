//
//  Navigator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class Navigator: BaseNavigator {
    
    override init() {}
    
    override func getAppWindow() -> UIWindow? {
        return AppDelegate.getAppWindow()
    }
    
    override func startInitialViewController() {
        let mainViewController: TabBarController = TabBarController.initFromNib()
        let window: UIWindow = getAppWindow()!
        //
        UIView.transition(
            with: window,
            duration: 0.3,
            options: .transitionFlipFromLeft,
            animations: {
                window.rootViewController = mainViewController
                window.makeKeyAndVisible()
        }, completion: nil)
    }
    
    func openTrendingMoviesViewController()  {
        let viewController = TrendingMoviesViewController()
        getCurrentViewController()?.navigationController?.pushViewController(viewController,
                                                                             animated: true)
    }
    
    func openCountriesViewController() {
        let viewController: CountriesViewController = CountriesViewController()
        getCurrentViewController()?.navigationController?.pushViewController(viewController,
                                                                             animated: true)
    }
    
    func openToDoViewController() {
        let viewController: ToDoViewPagerController = ToDoViewPagerController()
        getCurrentViewController()?.navigationController?.pushViewController(viewController,
                                                                             animated: true)
    }
    //
    @available(iOS 10.0, *)
    func goToSideMenuStoryboard() {
//        let mainViewController = TrendingMoviesViewController()
//        let leftSideMenuViewController: LeftSideMenuViewController = LeftSideMenuViewController()
//        let rightSideMenuViewController: RightSideMenuViewController = RightSideMenuViewController()
//        let navigationController: UINavigationController = GradientNavigationController(rootViewController: mainViewController)
        // Set the main menu view controller
      //  leftSideMenuViewController.mainViewController = mainViewController
      //  rightSideMenuViewController.mainViewController = mainViewController
        // Add rignt and/or left menu (We can add 2 different menues for right and left sides).
//        let slidingMenu = MySlidingMenu (mainViewController:navigationController, leftMenuViewController: leftSideMenuViewController)
     //   let slidingMenu = MySlidingMenu (mainViewController:navigationController, leftMenuViewController: leftSideMenuViewController, rightMenuViewController: rightSideMenuViewController)
        // getContext().navigationController?.pushViewController(slidingMenu, animated: true)
     //   getContext().present(slidingMenu, animated: true, completion: nil)
    }
    //
    static func goToCountryDetailsViewController(country : Country) {
      //  let countryDetailsViewController = mainStoryboard.instantiateViewController() as TableExampleView
      //  getContext().navigationController?.pushViewController(vc, animated: false)
    }
    
//    func goToCustomViewsViewController() {
//        let viewController: CustomViewsViewController = CustomViewsViewController()
//        Self.navigationController?.pushViewController(viewController, animated: true)
//    }
    
//    static func goToValidatorsExampleViewController() {
//        let viewController: ValidatorsExampleViewController = ValidatorsExampleViewController()
//        getContext().navigationController?.pushViewController(viewController, animated: true)
//    }
}
