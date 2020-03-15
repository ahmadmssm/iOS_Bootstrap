//
//  EncodableTransformer.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/14/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

#if swift(>=5.1)
public protocol EncodableTransformer {
    associatedtype Destination: Encodable
    associatedtype JsonObject
    static func transform(object: JsonObject) throws -> Destination?
}
#endif
