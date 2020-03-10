//
//  BaseViewDelegate.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/28/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import Foundation

public protocol BaseViewDelegate where Self: UIViewController {
    func showLoading()
    func hideLoading()
    func didGetError(errorMessage: String)
    func didGetWarning(warningMessage: String)
}

public extension BaseViewDelegate {
    func showLoading() {}
    func hideLoading() {}
    func didGetError(errorMessage: String) {}
    func didGetWarning(warningMessage: String) {}
}




