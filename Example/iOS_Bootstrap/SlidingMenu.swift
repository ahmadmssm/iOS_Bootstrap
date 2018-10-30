//
//  SlidingMenu.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/29/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

protocol SlidingMenuDelegator: BaseViewDelegator {}

class SlidingMenuPresenter: BasePresenter<SlidingMenuDelegator> {}

class SlidingMenu: BaseSideMenuController<SlidingMenuPresenter, SlidingMenuDelegator> {}
