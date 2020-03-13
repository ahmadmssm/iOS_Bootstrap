//
//  ToDosTableAdapterDelegate.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import Foundation

protocol ToDosTableAdapterDelegate {
    func didSelectRow(indexPath: IndexPath)
}
