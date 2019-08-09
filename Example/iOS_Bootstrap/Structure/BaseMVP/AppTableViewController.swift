//
//  AppTableViewController.swift
//  GitHubReposListingSample
//
//  Created by Ahmad Mahmoud on 8/3/19.
//  Copyright © 2019 Ahmad Mahmoud. All rights reserved.
//

import iOS_Bootstrap

class AppTableViewController<P, V, D, C>: BaseTableViewControllerV2<P, V, D, C>
                                          where
                                          P: AppPresenter<V>, C: BaseTableViewCellV2<D> {
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    
    override func initUI() {}
    
    override func localizeStrings() {}
    
    func setNavigationBarTitle(title: String) { self.navigationItem.title = title }
    
    final func removeNavigationBarBottomBorder() {
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    func showToast(toastMessage: String) {
        showToast(toastMessage: toastMessage, duration: 2.0, position: .center)
    }
}
