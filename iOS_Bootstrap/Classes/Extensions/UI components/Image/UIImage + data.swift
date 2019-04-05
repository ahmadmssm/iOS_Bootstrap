//
//  UIImage+ data.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/5/19.
//

import UIKit

public extension UIImage {
    // QUALITY min = 0 / max = 1
    var jpeg: Data? { return UIImageJPEGRepresentation(self, 1) }
    var png: Data? { return UIImagePNGRepresentation(self) }
}
