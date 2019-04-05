//
//  String + Replace character.swift
//  
//
//  Created by Ahmad Mahmoud on 2/18/19.
//  Copyright © 2019 Swyft. All rights reserved.
//

public extension String {
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
