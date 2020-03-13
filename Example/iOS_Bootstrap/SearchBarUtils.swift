//
//  SearchBarUtils.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/13/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit

class SearchBarUtils {
    
    private(set) var searchBar: UISearchBar!

    init(navigationItem: UINavigationItem) {
        let searchController = getNavigationBarSearchController(navigationItem: navigationItem)
        self.searchBar = searchController.searchBar
        configureSearchBarWith(searchController: searchController)
    }
    
    private func getNavigationBarSearchController(navigationItem: UINavigationItem) -> UISearchController {
           let searchController = NoCancelButtonSearchController(searchResultsController: nil)
           // Customize search controller
           searchController.hidesNavigationBarDuringPresentation = false
           // Add search controller to navigation controller
           navigationItem.searchController = searchController
           navigationItem.hidesSearchBarWhenScrolling = false
           // Override search bar cancel word
           // searchController.searchBar.setValue("", forKey: "cancelButtonText")
           return searchController
    }
    
    private func configureSearchBarWith(searchController: UISearchController) {
           // Customize search bar
           searchBar.tintColor = UIColor.white
           searchBar.barTintColor = UIColor.white
           let gradientLayer: CAGradientLayer = .getAppGradientLayerForView(view: searchBar)
           if let gardientImage = UIImage.getGradientImageFrom(gradientLayer: gradientLayer) {
               searchBar.backgroundColor = UIColor(patternImage: gardientImage)
           }
           if #available(iOS 13.0, *) {
               // Hide srach bar cancel button
               searchController.automaticallyShowsCancelButton = false
               searchBar.searchTextField.backgroundColor = UIColor.white
               searchBar.searchTextField.layer.cornerRadius = 15
               searchBar.searchTextField.layer.masksToBounds = true
               searchBar.searchTextField.textColor = UIColor.blue
               searchBar.searchTextField.tintColor = UIColor.blue
           }
           else {
               if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                   textfield.textColor = UIColor.blue
                   if let backgroundview = textfield.subviews.first {
                       backgroundview.backgroundColor = UIColor.white
                       // Rounded corner
                       backgroundview.layer.cornerRadius = 15
                       backgroundview.clipsToBounds = true
                   }
               }
           }
       }
}
