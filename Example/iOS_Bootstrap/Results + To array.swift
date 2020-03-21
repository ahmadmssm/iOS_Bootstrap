//
//  Results + To array.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RealmSwift

extension Results {
    func toArray<T>(type: T.Type) -> [T] { return compactMap { $0 as? T } }
}
