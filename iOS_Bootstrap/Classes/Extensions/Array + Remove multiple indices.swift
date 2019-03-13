//
//  Array + Remove multiple indices.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 3/13/19.
//

public extension Array {
    public mutating func remove(at indexs: [Int]) {
        guard !isEmpty else { return }
        let newIndexs = Set(indexs).sorted(by: >)
        newIndexs.forEach {
            guard $0 < count, $0 >= 0 else { return }
            remove(at: $0)
        }
    }
}
