//
//  UILabelExtensions.swift
//  PassApp
//
//  Created by Ahmad Mahmoud on 4/20/18.
//  Copyright © 2018 Robustastudio. All rights reserved.
//

import UIKit

// Format part of the textformat part of the text
public extension UILabel {
    func formatText (fullText : String, foregroundColor : UIColor, textToChange : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: textToChange)
        let attribute = NSMutableAttributedString.init(string: fullText)
        let attributes = [
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 17),
            NSAttributedStringKey.foregroundColor : foregroundColor
        ]
        attribute.addAttributes(attributes, range: range)
        self.attributedText = attribute
    }
}
