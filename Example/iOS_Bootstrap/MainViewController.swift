//
//  MainViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/2/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class MainViewController: BaseCollectionViewController<MainPresenter, MainViewDelegator, String>, MainViewDelegator, BaseCollectionViewDelegates {
    
    @IBOutlet weak var collectionView: UICollectionView!
    //
    private var collectionViewItems : [String]?
    
    override func viewDidLoad() {
        collectionViewItems = ["Side menu", "Custom views", "Switch language", "Validatiors"]
        super.viewDidLoad()
    }
    
    override func initUI() { self.title = "Home" }
    
    override func initCollectionViewAdapterConfiguraton() {
        getCollectionViewAdapter().configureCollectionviewWithXibCell(collectionView: collectionView, nibClass: MainViewCell.self, delegate: self)
        getCollectionViewAdapter().setDataSource(dataSource: collectionViewItems!)
        getCollectionViewAdapter().reloadCollectionView()
    }
    
    func configureCollectionViewCell(collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : MainViewCell = collectionView.dequeueReusableCell(forIndexPath: indexPath)
        cell.label.text = getCollectionViewDataSource[indexPath.row]
        cell.image.image = #imageLiteral(resourceName: "example")
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
    
}
