//
//  CardView.swift
//
//  Created by Ahmad Mahmoud on 3/21/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//


import UIKit

@IBDesignable
open  class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2

    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadow_Color: UIColor? = UIColor.black
    @IBInspectable var shadowTransparency: Float = 0.5

    override open func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)

        layer.masksToBounds = false
        layer.shadowColor = shadow_Color?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowTransparency
        layer.shadowPath = shadowPath.cgPath
    }
    
}
