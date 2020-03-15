////
////  GsonKeyConfigs.swift
////  iOS_Bootstrap_Example
////
////  Created by Ahmad Mahmoud on 3/14/20.
////  Copyright © 2020 CocoaPods. All rights reserved.
////
//
//import Foundation
//
//public struct GsonKeyConfigs {
//
//    public static var `default` = GsonKeyConfigs()
//    //
//    public var keyOptions: GsonKeyOptions
//    public var defaultJSONEncoder: () -> GsonEncoder
//    public var defaultJSONDecoder: () -> GsonDecoder
//
//    public init(keyOptions: GsonKeyOptions = GsonKeyOptions(delimiter: .character("."), flat: .emptyOrWhitespace),
//                keyedJSONDecoder: @escaping () -> GsonDecoder = GsonDecoder.init,
//                keyedJSONEncoder: @escaping () -> GsonEncoder = GsonEncoder.init) {
//
//        self.keyOptions = keyOptions
//        defaultJSONDecoder = keyedJSONDecoder
//        defaultJSONEncoder = keyedJSONEncoder
//    }
//}
