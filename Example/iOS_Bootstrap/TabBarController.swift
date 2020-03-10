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
        let vc1 = HomeViewController()
        let nv1 = GradientNavigationController(rootViewController: vc1)
        nv1.title = "First"
        nv1.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        //
        let vc2 = HomeViewController()
        let nv2 = GradientNavigationController(rootViewController: vc2)
        nv2.tabBarItem = UITabBarItem(title: "", image: nil, selectedImage: nil)
        //
        let vc3 = HomeViewController()
        let nv3 = GradientNavigationController(rootViewController: vc3)
        nv3.title = "Third"
        nv3.tabBarItem = UITabBarItem(tabBarSystemItem: .downloads, tag: 0)
        //
        viewControllers = [nv1, nv2, nv3]
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
