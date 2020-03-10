//
//  FloatExtensions.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/10/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

extension CGFloat {
    var degreesToRadians: CGFloat { return self * .pi / 180 }
    var radiansToDegrees: CGFloat { return self * 180 / .pi }
}
