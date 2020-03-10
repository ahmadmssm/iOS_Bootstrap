//
//  AdapterModules.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/9/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Resolver

extension Resolver {
    static func AdapterModules() {
        register { (resolver, args: Any) -> HomeCollectionViewAdapter in
            let collectionView: UICollectionView = resolver.firstArgument(from: args)!
            let datasource: [String] = resolver.secondArgument(from: args)!
            let delegate: HomeCollectionViewDelegate? = resolver.thirdArgument(from: args)!
            return HomeCollectionViewAdapter(collectionView: collectionView,
                                             dataSource: datasource,
                                             mainCollectionViewDelegate: delegate!)
        }
    }
}
