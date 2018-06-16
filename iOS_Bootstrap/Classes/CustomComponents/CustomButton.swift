//
//  CustomButton.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/13/18.
//
//  Ref : https://blog.supereasyapps.com/how-to-create-round-buttons-using-ibdesignable-on-ios-11/
//

import UIKit

@IBDesignable
open class CustomButton: UIButton {
   
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable public var topGradientColor: UIColor? = .clear {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }

    @IBInspectable public var bottomGradientColor: UIColor? = .clear {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    override open class var layerClass : AnyClass {
        get {
            return CAGradientLayer.self
        }
    }
    
    private func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
            let layer = self.layer as! CAGradientLayer
            layer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            layer.startPoint = CGPoint(x: 0.0, y: 0.0)
            layer.endPoint = CGPoint(x: 1.0, y: 0.0)
        }
    }
    
}


