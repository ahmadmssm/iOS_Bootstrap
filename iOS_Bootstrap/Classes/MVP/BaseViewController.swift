//
//  BaseViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

open class BaseViewController <T: BasePresenter> : UIViewController, BaseContractProtocol  {
    public var presenter : T!
    open override func viewDidLoad() { self.presenter = T.init(contract: self) }
}


