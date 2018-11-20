//
//  NoCancelButtonSearchController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/19/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class NoCancelButtonSearchController: UISearchController {
    let noCancelButtonSearchBar = NoCancelButtonSearchBar()
    override var searchBar: UISearchBar { return noCancelButtonSearchBar }
}

class NoCancelButtonSearchBar: UISearchBar {
    override func setShowsCancelButton(_ showsCancelButton: Bool, animated: Bool) {}
}
