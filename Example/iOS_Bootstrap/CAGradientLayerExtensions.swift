//
//  CAGradientLayerExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension CAGradientLayer {
    static func getAppGradientLayerForView(view: UIView) -> CAGradientLayer {
        let gradient : CAGradientLayer = CAGradientLayer()
        gradient.frame = view.bounds
        gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        return gradient
    }
}
