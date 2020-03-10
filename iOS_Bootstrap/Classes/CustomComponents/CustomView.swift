 //  CustomView.swift
 //  iOS_Bootstrap
 //
//  Created by Ahmad Mahmoud on 6/17/18.
 //
 
import UIKit

@IBDesignable
open class CustomView: UIView {


    @IBInspectable public var cornerRadius: CGFloat = 2 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable public var shadowRadius: CGFloat = 2 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }

    @IBInspectable public var shadowColor: UIColor = .clear {
        didSet {
            layer.shadowColor = shadowColor.cgColor
        }
    }

    @IBInspectable public var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable public var backgroundImage: UIImage? {
        didSet {
            layer.contents = backgroundImage?.cgImage
        }
    }

    @IBInspectable public var shadowOffsetWidth: Int = 0
    @IBInspectable public var shadowOffsetHeight: Int = 3
    @IBInspectable public var shadowOpacity: Float = 0.5

    override open func layoutSubviews() {
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
}
