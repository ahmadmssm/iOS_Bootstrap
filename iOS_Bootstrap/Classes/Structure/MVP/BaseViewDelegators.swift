//
//  BaseViewDelegator.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation

@objc public protocol BaseViewDelegator where Self: UIViewController {
    @objc optional func loadingDidStarted()
    @objc optional func didFinishedLoading()
}

@objc public protocol BaseTableViewDelegator : BaseViewDelegator {
    @objc optional func didGetTableViewItems(forPage page: Int, updatedDataSource: [Any])
}

@objc public protocol BaseCollectionViewDelegator : BaseViewDelegator {
    @objc optional func didGetCollectionViewItems(forPage page: Int, updatedDataSource: [Any])
}





