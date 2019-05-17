//
//  String + Remove all non numeric.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 5/15/19.
//

extension RangeReplaceableCollection where Self: StringProtocol {
    public var removeAllNonNumeric: Self {
        return filter(("0"..."9").contains)
    }
}
