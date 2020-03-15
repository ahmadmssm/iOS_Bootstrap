////
////  JsonKey.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//import Foundation
//
//public struct JsonKey: CodingKey, Hashable, AnyKeyedKey {
//
//    public let stringValue: String
//    public let intValue: Int?
//
//    public let options: KeyOptions?
//
//    public init(stringValue: String, options: KeyOptions) {
//        self.stringValue = stringValue
//        intValue = nil
//        self.options = options
//    }
//
//    public init(intValue: Int, options: KeyOptions) {
//        stringValue = String(intValue)
//        self.intValue = intValue
//        self.options = options
//    }
//
//    public init(stringValue: String) {
//        self.stringValue = stringValue
//        intValue = nil
//        options = nil
//    }
//
//    public init(intValue: Int) {
//        stringValue = String(intValue)
//        self.intValue = intValue
//        options = nil
//    }
//
//    public init(key: CodingKey, options: KeyOptions? = nil) {
//        if let intValue = key.intValue { self.init(intValue: intValue) }
//        else { self.init(stringValue: key.stringValue )}
//    }
//}
