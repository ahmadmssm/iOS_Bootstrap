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
    private var collectionViewAdapter: HomeCollectionViewAdapter!
    
    override func localizeStrings() {
        self.navigationItem.title = "home".localized()
    }
            
    func didSelectItem(indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            navigator.openTrendingMoviesViewController()
            break
        case 1:
            navigator.openCountriesViewController()
            break
        case 2:
            navigator.openToDoViewController()
            break
        case 3:
            navigator.openWeatherForcastingViewController()
            break
        case 4:
            getPresenter().switchAppLanguage()
            break
        case 5:
            // navigator.goToValidatorsExampleViewController()
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
                                                          homeCollectionViewDelegate: self)
    }
    
    func didSwitchAppLanguage() {
        navigator.startInitialViewController()
    }
}
