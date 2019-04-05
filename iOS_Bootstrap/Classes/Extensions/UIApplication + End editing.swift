//
//  UIApplication + End editing.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 4/5/19.
//

import UIKit

public extension UIApplication {
    /// Dismiss keyboard from key window.
    /// Example Usage: `UIApplication.endEditing(true)`.
    ///
    /// - Parameters:
    ///     - force: specify `true` to force first responder to resign.
    static func endEditing(_ force: Bool = false) {
        shared.keyWindow?.endEditing(force)
    }
}
