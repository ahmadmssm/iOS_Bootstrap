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

// Basic MVP + View pager
open class BaseMenuItemViewPagerController <T, V> :
    DTPagerController<T, V>,
    SideMenuItemCommonFunctions
    where T : BasePresenter<V> {}

// Base table view + MVP
open class BaseMenuItemTableViewController <T, V, M> :
                    BaseTableViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}

// Base table view (v2) + MVP
open class BaseMenuItemTableViewControllerV2 <T, V, M, C>:
                    BaseTableViewControllerV2<T, V, M, C>,
                    SideMenuItemCommonFunctions
                    where T: BasePresenter<V>, C: BaseTableViewCellV2<M> {}

// Base live table view + MVP
open class BaseMenuItemLiveTableViewController <T, V, M> :
                    BaseLiveTableViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BaseLiveListingPresenter<V, M> {}

// Base live table view (v2) + MVP
open class BaseMenuItemLiveTableViewControllerV2 <T, V, M, C> :
                BaseLiveTableViewControllerV2<T, V, M, C>,
                SideMenuItemCommonFunctions
                where T : BaseLiveListingPresenter<V, M>, C: BaseTableViewCellV2<M> {}

// Base collection view + MVP
open class BaseMenuItemCollectionViewController <T, V, M> :
                    BaseCollectionViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BasePresenter<V> {}

// Base collection view (v2) + MVP
open class BaseMenuItemCollectionViewControllerV2 <T, V, M, C>:
                    BaseCollectionViewControllerV2<T, V, M, C>,
                    SideMenuItemCommonFunctions
                    where T: BasePresenter<V>, C: BaseCollectionViewCellV2<M> {}

// Base live collection view + MVP
open class BaseMenuItemLiveCollectionViewController <T, V, M> :
                    BaseLiveCollectionViewController<T, V, M>,
                    SideMenuItemCommonFunctions
                    where T : BaseLiveListingPresenter<V, M> {}

// Base live collection view (v2) + MVP
open class BaseMenuItemLiveCollectionViewControllerrV2 <T, V, M, C> :
            BaseLiveCollectionViewControllerV2<T, V, M, C>,
            SideMenuItemCommonFunctions
            where T : BaseLiveListingPresenter<V, M>, C: BaseCollectionViewCellV2<M> {}
