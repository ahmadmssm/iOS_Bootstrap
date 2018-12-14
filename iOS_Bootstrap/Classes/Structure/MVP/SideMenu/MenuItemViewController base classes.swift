//
//  BaseMenuItemViewController.swift
//  iOS_Bootstrap
//
//  Created by Ahmad Mahmoud on 10/29/18.
//

import UIKit

public protocol SideMenuItemCommonFunctions {
    func performBackAction ()
}
public extension SideMenuItemCommonFunctions {
    func performBackAction() { EventBus.post("com.iOS_Bootstrap.performBackAction") }
}

// Basic MVP
open class BaseMenuItemViewController <T, V> :
                    BaseViewController<T, V>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}

// Basic MVP + TabBar
open class BaseMenuItemTabBarController <T, V> :
                    BaseTabBarController<T, V>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}


// Base table view + MVP
open class BaseMenuItemTableViewController <T, V, M> :
                    BaseTableViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}
//
// Base live table view + MVP
open class BaseMenuItemLiveTableViewController <T, V, M> :
                    BaseLiveTableViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BaseLiveListingPresenter<V, M> {}

// Base collection view + MVP
open class BaseMenuItemCollectionViewController <T, V, M> :
                    BaseCollectionViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}

// Base live collection view + MVP
open class BaseMenuItemLiveCollectionViewController <T, V, M> :
                    BaseLiveCollectionViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BaseLiveListingPresenter<V, M> {}
