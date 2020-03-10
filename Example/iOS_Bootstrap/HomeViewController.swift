//
//  HomeViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class HomeViewController:
    AppViewController<HomePresenter, HomeViewDelegate>,
    HomeViewDelegate,
    HomeCollectionViewDelegate {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    var collectionViewAdapter: HomeCollectionViewAdapter!

    override func initUI() {
        self.navigationItem.title = "Home"
    }
        
    func didSelectItem(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
           if #available(iOS 10.0, *) { Navigator.goToSideMenuStoryboard() }
            break
        case 1:
            Navigator.goToCustomViewsViewController()
            break
        case 2:
            getPresenter().switchAppLanguage()
            break
        case 3:
            Navigator.goToValidatorsExampleViewController()
            break
        default:
            break
        }
    }
    
    func configureViewControllerSnackBar() -> TTGSnackbar {
        let newSnackBar = TTGSnackbar(message: "",duration: .short)
        newSnackBar.backgroundColor = UIColor.green
        return newSnackBar
    }
        
    func didGetCollectioViewItems(items: [String]) {
        collectionViewAdapter = HomeCollectionViewAdapter(collectionView: collectionView,
                                                           dataSource: items,
                                                           mainCollectionViewDelegate: self)
    }
    
    override func networkStatusDidChange(isConnected: Bool) {
//        super.networkStatusDidChange(isConnected: isConnected)
//        print("Status ", isConnected, "Connected through ->", getNetworkConnectionType())
    }
}
