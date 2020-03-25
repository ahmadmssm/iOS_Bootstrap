//
//  SnackbarUtils.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/25/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit.UIColor

class SnackbarUtils {
    
    private static var snackbar = TTGSnackbar()
    
    static func showWith(message: String, duration: TTGSnackbarDuration, backgroundColor: UIColor) {
        DispatchQueue.main.async {
            snackbar.message = message
            snackbar.duration = duration
            snackbar.backgroundColor = backgroundColor
            snackbar.actionText = "Cancel"
            snackbar.actionBlock = { (snackbar) in
                snackbar.dismiss()
            }
            snackbar.show()
        }
    }
}
