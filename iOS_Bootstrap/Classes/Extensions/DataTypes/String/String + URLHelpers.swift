//
//  URLHelpers.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 1/19/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation

public extension String {
    public var escapedURL: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
    public var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
