//
//  NavigationCoordinator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class NavigationCoordinator: BaseNavigationCoordinator  {
    
    static let getInstance = NavigationCoordinator()
    
    private override init() {}
    
    //
    func goToHomeStoryBoard(number : Int) {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
        let homeVC = storyboard.instantiateViewController() as MyViewController
        homeVC.navigator = self
        homeVC.x = number
        // To present
        // AppDelegate.getContext().present(homeVC, animated: true, completion: nil)
        // To push
        navigationController?.pushViewController(homeVC, animated: false)
    }
    
    func startInitialView() {
        // Write initial (first) view controller navigation here
        let storyboard =  UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as ViewController
        vc.navigator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
