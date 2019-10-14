//
//  UIViewController + SideMenuIcon.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/29/18.
//

public extension UIViewController {
    final func setLeftSideMenuNavigationBarItem(icon : UIImage) {
        self.addLeftBarButtonWithImage(icon)
        self.slideMenuController()?.removeLeftGestures()
        self.slideMenuController()?.addLeftGestures()
    }
    
    final func setRightSideMenuNavigationBarItem(icon : UIImage) {
        self.addRightBarButtonWithImage(icon)
        self.slideMenuController()?.removeRightGestures()
        self.slideMenuController()?.addRightGestures()
    }
    
    final func removeLeftSideMenuNavigationBarItem() {
        self.navigationItem.leftBarButtonItem = nil
        self.slideMenuController()?.removeLeftGestures()
    }
    
    final func removeRightSideMenuNavigationBarItem() {
        self.navigationItem.rightBarButtonItem = nil
        self.slideMenuController()?.removeRightGestures()
    }
}
