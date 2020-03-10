//
//  TabBarController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {
                   
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        configureTabBarCenterButton()
        configureTabBarItems()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("Selected item " + item.description)
    }
    
    private func configureTabBarItems() {
        let firstItem = HomeViewController()
        let firstNavigationController = GradientNavigationController(rootViewController: firstItem)
        firstItem.title = "First"
        firstItem.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        //
        let secondItem = TrendingMoviesViewController()
        let secondtNavigationController = GradientNavigationController(rootViewController: secondItem)
        secondtNavigationController.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        //
        let thirdItem = TrendingMoviesViewController()
        let thirdNavigationController = GradientNavigationController(rootViewController: thirdItem)
        thirdNavigationController.title = "Third"
        thirdNavigationController.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        //
        viewControllers = [firstNavigationController, secondtNavigationController, thirdNavigationController]
    }
    
    private func configureTabBarCenterButton() {
        let tabBarCenteredButton = UIButton()
        tabBarCenteredButton.setImage(#imageLiteral(resourceName: "home"), for: .normal)
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
        selectedIndex = 1
    }
}
