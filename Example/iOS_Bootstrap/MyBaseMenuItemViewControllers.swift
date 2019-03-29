//
//  MyMenuItemViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 10/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MyMenuItemViewController <P, V>: BaseMenuItemViewController <P, V> where P: BasePresenter<V> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemTabBarController <P, V>: BaseMenuItemTabBarController <P, V> where P: BasePresenter<V> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemViewPagerController <P, V>: BaseMenuItemViewPagerController <P, V> where P: BasePresenter<V> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemTableViewController <P, V, M>: BaseMenuItemTableViewController <P, V, M> where P: BasePresenter<V> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemTableViewControllerV2 <P, V, M, C>:
                 BaseMenuItemTableViewControllerV2 <P, V, M, C>
                 where P: BasePresenter<V>, C: BaseTableViewCellV2<M>  {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemLiveTableViewController <P, V, M>:
    BaseMenuItemLiveTableViewController <P, V, M> where P: BaseLiveListingPresenter<V, M> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

class MyMenuItemLiveTableViewControllerV2 <P, V, M, C>:
                    BaseMenuItemLiveTableViewControllerV2 <P, V, M, C>
                    where P: BaseLiveListingPresenter<V, M> , C: BaseTableViewCellV2<M>  {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addCustomLeftMenuItemViewController()
        self.setRightSideMenuNavigationBarItem(icon: #imageLiteral(resourceName: "side_menu"))
    }
    override func localizeStrings() {}
}

extension UIViewController {
    func addCustomLeftMenuItemViewController() {
        let menuButton = UIButton.init(type: .custom)
        menuButton.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        // negative space to reduce margin betwwen parent and the bar button
        menuButton.contentEdgeInsets = UIEdgeInsets(top: 0, left: -12.0, bottom: 0, right: 0)
        menuButton.setImage(#imageLiteral(resourceName: "side_menu"), for: .normal)
        menuButton.addTarget(self, action: #selector(self.toggleLeft), for: .touchUpInside)
        let leftButton: UIBarButtonItem = UIBarButtonItem(customView: menuButton)
        // set back button
        navigationItem.leftBarButtonItem = leftButton
    }
}
