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
    
    let gradientLayer = CAGradientLayer()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override open func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    public func sharedInit() {
        refreshCorners(value: cornerRadius)
        refreshColor(color: backgroundImageColor)
    }
    
    public func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }

    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    @IBInspectable
    var topGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    @IBInspectable
    var bottomGradientColor: UIColor? {
        didSet {
            setGradient(topGradientColor: topGradientColor, bottomGradientColor: bottomGradientColor)
        }
    }
    
    public func createImage(color: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 1, height: 1), true, 0.0)
        color.setFill()
        UIRectFill(CGRect(x: 0, y: 0, width: 1, height: 1))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        return image
    }

    public func refreshColor(color: UIColor) {
        let image = createImage(color: color)
        setBackgroundImage(image, for: UIControlState.normal)
        clipsToBounds = true
    }

    @IBInspectable var backgroundImageColor: UIColor = UIColor.init(red: 0, green: 122/255.0, blue: 255/255.0, alpha: 1) {
        didSet {
            refreshColor(color: backgroundImageColor)
        }
    }

    public func setGradient(topGradientColor: UIColor?, bottomGradientColor: UIColor?) {
        if let topGradientColor = topGradientColor, let bottomGradientColor = bottomGradientColor {
   
         
            gradientLayer.colors = [topGradientColor.cgColor, bottomGradientColor.cgColor]
            
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            
            gradientLayer.borderColor = layer.borderColor
            gradientLayer.borderWidth = layer.borderWidth
            gradientLayer.cornerRadius = layer.cornerRadius
            
            gradientLayer.frame = bounds
           // gradientLayer.bounds = bounds
            
            layer.addSublayer(gradientLayer)
            
          
        }
        else {
            gradientLayer.removeFromSuperlayer()
        }
    }
}

