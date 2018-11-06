//
//  BaseMenuItemViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/29/18.
//

import UIKit

// Basic MVP
open class BaseMenuItemViewController <T, V> : BaseViewController<T, V> where T : BasePresenter<V> {}

// Basic MVP + TabBar
open class BaseMenuItemTabBarController <T, V> : BaseTabBarController<T, V> where T : BasePresenter<V> {}


// Base table view + MVP
open class BaseMenuItemTableViewController <T, V, M> : BaseTableViewController<T, V, M> where T : BasePresenter<V> {}

// Base collection view + MVP
open class BaseMenuItemCollectionViewController <T, V, M> : BaseCollectionViewController<T, V, M> where T : BasePresenter<V> {}


