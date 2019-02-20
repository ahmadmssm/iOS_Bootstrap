//
//  UIViewController + Classs name.swift
//
//
//  Created by Ahmad Mahmoud on 2/18/19.
//  Copyright © 2019 Swyft. All rights reserved.
//

public extension UIViewController {
    public var className : String { return String(describing: self.classForCoder) }
}
