//
//  UIImage + To:From data.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 2/15/19.
//

import UIKit
import Foundation

public extension Data { public var uiImage: UIImage? { return UIImage(data: self) } }

public extension UIImage {
    // QUALITY min = 0 / max = 1
    // public var jpeg: Data? { return self.jpegData(compressionQuality: 1) }
   // public var png: Data? { return self.pngData() }
}
