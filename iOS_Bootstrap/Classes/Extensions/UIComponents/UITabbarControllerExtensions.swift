//
//  UITabbarControllerExtensions.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

import UIKit

// Tabbar items
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
    
    func enableTabBarItem(_ tab: Int) {
        enableTabBarItems(tab)
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
    
    func disableTabBarItem(_ tab: Int) {
        disableTabBarItems(tab)
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
