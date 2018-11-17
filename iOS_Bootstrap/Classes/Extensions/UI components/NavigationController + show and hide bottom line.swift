//
//  NavigationController + show and hide bottom line.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/18/18.
//

public extension UINavigationBar {
    public func hideBottomLine() { self.hairlineImageView?.isHidden = true }
    public func showBottomLine() { self.hairlineImageView?.isHidden = false }
}

