//
//  String + Localizable.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 8/4/18.
//
//  How to use :
//  "Goodbye".localized()
//  "Hello".localized(withComment: "Simple greeting")
//

public extension String {
    func localized(withComment comment: String? = nil) -> String {
        return NSLocalizedString(self, comment: comment ?? "")
    }
}

