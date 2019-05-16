//
//  UIViewController + Tabbar items.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

import UIKit

public extension UIViewController {
    
    func enableAllTabBarItems() {
        if let tabBarItems = tabBarController?.tabBar.items as NSArray? {
            for i in 0..<tabBarItems.count {
                if let tabBarItem = tabBarItems[i] as? UITabBarItem {
                    tabBarItem.isEnabled = true
                }
            }
        }
    }
    
    func enableTabBarItems(_ tabs: Int...) {
        if let tabBarItems = tabBarController?.tabBar.items as NSArray? {
            for indexOfTabToBeDisabled in tabs {
                if let tabBarItem = tabBarItems[indexOfTabToBeDisabled] as? UITabBarItem {
                    tabBarItem.isEnabled = true
                }
            }
        }
    }
    
    func disableTabBarItems(_ tabs: Int...) {
        if let tabBarItems = tabBarController?.tabBar.items as NSArray? {
            for indexOfTabToBeDisabled in tabs {
                if let tabBarItem = tabBarItems[indexOfTabToBeDisabled] as? UITabBarItem {
                    tabBarItem.isEnabled = false
                }
            }
        }
    }
    
    func disableAllTabBarItems() {
        if let tabBarItems = tabBarController?.tabBar.items as NSArray? {
            for i in 0..<tabBarItems.count {
                if let tabBarItem = tabBarItems[i] as? UITabBarItem {
                    tabBarItem.isEnabled = false
                }
            }
        }
    }
}
