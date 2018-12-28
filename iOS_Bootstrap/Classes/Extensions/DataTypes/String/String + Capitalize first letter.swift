//
//  String + Capitalize first letter.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 12/28/18.
//
// Ref: https://stackoverflow.com/questions/26306326/swift-apply-uppercasestring-to-only-the-first-letter-of-a-string

extension String {
    func capitalizingFirstLetter() -> String {        
        return prefix(1).uppercased() + self.dropFirst()
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}

