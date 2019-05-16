//
//  MainViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MainViewController:
    BaseCollectionViewControllerV2 <MainPresenter, MainViewDelegator, String, MainViewCell>,
    MainViewDelegator, BaseCollectionViewDelegates {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPresenter().setDataSource()
    }
    
    override func initUI() { self.title = "Home" }
    
    override func localizeStrings() {}
    
    override func initCollectionViewAdapterConfiguraton() {
        super.initCollectionViewAdapterConfiguraton(collectionView: collectionView, delegate: self)
    }
    
    func configureCollectionViewCell(collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MainViewCell = self.initCell(indexPath: indexPath)
        return cell
    }
    
    func sizeForItemAtIndexPath(collectionViewLayout: UICollectionViewLayout) -> CGSize {
        return getCollectionViewAdapter().configureNumberOfCollectionViewItemsPerRow(numberOfItemsPerRow: 2, padding: 25)
    }
    
    func itemDidSelected(collectionView: UICollectionView, indexPath: IndexPath) {
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
    
    override func configureViewControllerSnackBar() -> TTGSnackbar {
        let newSnackBar = TTGSnackbar(message: "",duration: .short)
        newSnackBar.backgroundColor = UIColor.green
        return newSnackBar
    }
    
    func didGetCollectioViewItems(items: [String]) {
        getCollectionViewAdapter().setDataSource(dataSource: items)
        getCollectionViewAdapter().reloadCollectionView()
    }
    
    override func networkStatusDidChange(isConnected: Bool) {
        super.networkStatusDidChange(isConnected: isConnected)
        print("Status ", isConnected, "Connected through ->", getNetworkConnectionType())
    }
}
