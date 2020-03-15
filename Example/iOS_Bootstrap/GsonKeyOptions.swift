////
////  GsonKeyOptions.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//public struct GsonKeyOptions: Hashable {
//    
//    public var flat: Flat
//    public var delimiter: Delimiter
//
//    public init(delimiter: Delimiter = GsonKeyConfigs.default.keyOptions.delimiter,
//                flat: Flat = GsonKeyConfigs.default.keyOptions.flat) {
//        self.flat = flat
//        self.delimiter = delimiter
//    }
//
//    public enum Delimiter: Hashable {
//        case none
//        case character(_ character: Character)
//    }
//
//    public enum Flat: Hashable {
//        case none
//        case emptyOrWhitespace
//        case string(_ string: String)
//
//        public func isFlat(key: CodingKey) -> Bool {
//            switch self {
//            case .none: return false
//            case .emptyOrWhitespace: return key.intValue == nil && key.stringValue.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
//            case .string(let string): return key.stringValue == string
//            }
//        }
//    }
//}
