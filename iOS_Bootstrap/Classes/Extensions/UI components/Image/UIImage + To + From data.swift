//
//  UIImage + To + From data.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

import UIKit

public extension Data { var uiImage: UIImage? { return UIImage(data: self) } }

public extension UIImage {
    // QUALITY min = 0 / max = 1
    var jpeg: Data? { return UIImageJPEGRepresentation(self, 1) }
    var png: Data? { return UIImagePNGRepresentation(self) }
}
