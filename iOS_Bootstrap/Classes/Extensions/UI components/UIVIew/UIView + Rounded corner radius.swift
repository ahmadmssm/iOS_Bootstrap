//
//  UIView + Rounded corner radius.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/5/19.
//

import UIKit

public extension UIView {
    func withRoundCornerRadius()  {
        layer.cornerRadius = self.frame.height / 2.0
        layer.masksToBounds = true
    }
}
