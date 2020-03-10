//
//  ShowHideBottomLine.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 11/18/18.
//

public extension UINavigationBar {
    func hideBottomLine() { self.hairlineImageView?.isHidden = true }
    func showBottomLine() { self.hairlineImageView?.isHidden = false }
}

