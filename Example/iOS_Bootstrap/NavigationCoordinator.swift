//
//  NavigationCoordinator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class NavigationCoordinator: BaseNavigationCoordinator {
    
    static let getInstance = NavigationCoordinator()
    private override init() {
        super.init()
    }
    //
    func goToHomeStoryBoard(number : Int) {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboard.main.rawValue)
        let homeVC = storyboard.instantiateViewController() as MyViewController
        homeVC.navigator = self
        homeVC.x = number
       // AppDelegate.getContext().present(homeVC, animated: true, completion: nil)
        navigationController?.pushViewController(homeVC, animated: false)
    }
    
    func startInitialView() {
        let storyboard =  UIStoryboard.getStoryboardWithName(Storyboard.main.rawValue)
        let vc = storyboard.instantiateViewController() as ViewController
        vc.navigator = self
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
