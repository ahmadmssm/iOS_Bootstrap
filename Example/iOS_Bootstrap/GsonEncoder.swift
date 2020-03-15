////
////  GsonEncoder.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//import Foundation
//
//open class GsonEncoder: JSONEncoder {
//
//    open override func encode<T>(_ value: T) throws -> Data where T : Encodable {
//        if let string = value as? String {
//            return try Data.from(string: string)
//        }
//        else if let int = value as? Int {
//            return try Data.from(string: "\(int)")
//        }
//        else if let lossless = value as? LosslessStringConvertible {
//            return try Data.from(string: lossless.description)
//        }
//        else {
//            return try super.encode(Keyed(value))
//        }
//    }
//}
