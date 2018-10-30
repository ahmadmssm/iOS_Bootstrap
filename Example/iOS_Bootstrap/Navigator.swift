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
    static func goToMainStoryBoard(number : Int) {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as MyViewController
        vc.x = number
        getContext().present(vc, animated: true, completion: nil)
    }
    
    static func goToSideMenuStoryboard() {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.menu)
        let mainViewController : SwiftViewController = storyboard.instantiateViewController()
        let sideMenuViewController : SideMenuViewController = storyboard.instantiateViewController()
        let navigationController: UINavigationController = UINavigationController(rootViewController: mainViewController)
        // Set the main menu view controller
        sideMenuViewController.mainViewController = mainViewController
        // Add rignt and/or left menu (We can add 2 different menues for right and left sides).
        let slidingMenu = MySlidingMenu ( mainViewController:navigationController, leftMenuViewController: sideMenuViewController)
        getContext().present(slidingMenu, animated: true, completion: nil)
    }
    
    static func goToHomeStoryBoard() {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.home)
        let vc = storyboard.instantiateViewController() as HomeVC
        getContext().present(vc, animated: true, completion: nil)
    }
    
    static func goToExambleOfTableViewController() {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as TableExampleView
        getContext().navigationController?.pushViewController(vc, animated: false)
    }
    
    static func startInitialView() {
        // Write initial (first) view controller navigation here
        let storyboard =  UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as ViewController
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
