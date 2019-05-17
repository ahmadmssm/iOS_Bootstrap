//
//  String + Attributed.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

public extension String {
    var centeredAttributedString: NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .justified
        let textAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.black,
            .font : UIFont.systemFont(ofSize: 12)
        ]
        let attributedString = NSAttributedString(string: self,
                                                  attributes: textAttributes)
        return attributedString
    }
    
    var attributedString: NSAttributedString {
        let textAttributes: [NSAttributedString.Key: Any] = [
            .strokeColor : UIColor.black,
            .foregroundColor : UIColor.black,
            .font : UIFont.systemFont(ofSize: 12)
        ]
        let attributedString = NSAttributedString(string: self,
                                                  attributes: textAttributes)
        return attributedString
    }
    
    var attributedStringWithClickableURL: NSAttributedString {
        return attributedStringWithClickableURL(urlName: self)
    }
    
    func attributedStringWithClickableURL(urlName: String) -> NSAttributedString {
        let clickableLink = NSMutableAttributedString(string: urlName)
        let url = URL(string: self)
        clickableLink.setAttributes([.link: url ?? ""], range: NSMakeRange(0, clickableLink.length))
        return clickableLink
    }
}
