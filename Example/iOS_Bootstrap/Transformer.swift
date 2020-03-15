//
//  Transformer.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/14/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

public protocol Transformer: DecodableTransformer, EncodableTransformer where Source == Destination { }
