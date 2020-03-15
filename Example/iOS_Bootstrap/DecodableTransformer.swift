//
//  DecodableTransformer.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/14/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#if swift(>=5.1)
public protocol DecodableTransformer {
    associatedtype Source: Decodable
    associatedtype JsonObject
    static func transform(from decodable: Source) throws -> Any?
}
#endif
