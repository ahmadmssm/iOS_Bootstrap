//
//  TabBarController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
                   
    private var tabBarCenteredButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureTabBarCenterButton()
        configureTabBarItems()
        // Set Initial selected index
        selectedIndex = 1
        tabBarCenteredButton.isSelected = true
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if (item.tag == 1) {
            tabBarCenteredButton.isSelected = true
        }
        else {
            tabBarCenteredButton.isSelected = false
        }
    }
    
    private func configureTabBarItems() {
        let firstItem = TrendingMoviesViewController()
        firstItem.title = "First"
        let firstNavigationController = GradientNavigationController(rootViewController: firstItem)
        firstNavigationController.tabBarItem = UITabBarItem(title: "", image: #imageLiteral(resourceName: "side_menu"), selectedImage: #imageLiteral(resourceName: "side_menu"))
        firstNavigationController.tabBarItem.tag = 0
        //
        let secondItem = HomeViewController()
        let secondtNavigationController = GradientNavigationController(rootViewController: secondItem)
        secondtNavigationController.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        secondtNavigationController.tabBarItem.tag = 1
        //
        let thirdItem = TrendingMoviesViewController()
        let thirdNavigationController = GradientNavigationController(rootViewController: thirdItem)
        thirdNavigationController.title = "Third"
        thirdNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        //
        viewControllers = [firstNavigationController, secondtNavigationController, thirdNavigationController]
    }
        
    private func configureTabBarCenterButton() {
        tabBarCenteredButton = UIButton()
        tabBarCenteredButton.setImage(#imageLiteral(resourceName: "home_not_selected"), for: .normal)
        tabBarCenteredButton.setImage(#imageLiteral(resourceName: "home"), for: .selected)
        tabBarCenteredButton.isUserInteractionEnabled = true
        tabBarCenteredButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tabBarCenteredButton)
        tabBarCenteredButton.addTarget(self, action:#selector(switctToHomeTab), for: .touchUpInside)
        //
        NSLayoutConstraint.activate([
            tabBarCenteredButton.widthAnchor.constraint(equalToConstant: 65),
            tabBarCenteredButton.heightAnchor.constraint(equalToConstant: 65),
            tabBarCenteredButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            tabBarCenteredButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }
    
    @objc private func switctToHomeTab(sender: UIButton) {
        tabBarCenteredButton.isSelected = true
        selectedIndex = 1
    }
}
