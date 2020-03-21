//
//  UIStoryboard+Storyboards.swift
//  AHStoryboard
//
//  Created by Andyy Hope on 19/01/2016, Edited by Ahmad Mahmoud on Jul 07/20/2018.
//  Copyright © 2016 Andyy Hope. All rights reserved.
//

import UIKit

extension UIViewController: StoryboardIdentifiable { }

extension UIViewController {
    
    public func presentViewController(withStoryboardName storyboard: String, withIdentifier identifier: String? = nil){
        let sb = UIStoryboard(name: storyboard, bundle: Bundle.main)
        var viewController: UIViewController?
        if identifier != nil {
            let vc = sb.instantiateViewController(withIdentifier: identifier!)
            viewController = vc
        }
        else {
            if let initial = sb.instantiateInitialViewController(){ viewController = initial }
        }
        
        if viewController != nil {
            present(viewController!, animated: true, completion: nil)
        }
    }
}

extension UIStoryboard {
    
//    // MARK: - Convenience Initializers
//    convenience init(storyboard: String, bundle: Bundle? = nil) {
//        self.init(name: storyboard.capitalized, bundle: bundle)
//    }
    
    // MARK: - Convenience Initializers
    convenience init(storyboard: String, bundle: Bundle? = nil) {
        self.init(name: storyboard.capitalizingFirstLetter(), bundle: bundle)
    }
    
//    // MARK: - Class Functions
//    open class func getStoryboardWithName <T: RawRepresentable>(_ storyboard: T, bundle: Bundle? = nil) -> UIStoryboard where T.RawValue == String {
//        return UIStoryboard(name: storyboard.rawValue.capitalized, bundle: bundle)
//    }
    
    // MARK: - Class Functions
    open class func getStoryboardWithName <T: RawRepresentable>(_ storyboard: T, bundle: Bundle? = nil) -> UIStoryboard where T.RawValue == String {
        return UIStoryboard(name: storyboard.rawValue.capitalizingFirstLetter(), bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    public func instantiateViewController<T>() -> T where T: StoryboardIdentifiable {
        guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T
        else {
                fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier)")
        }
        return viewController
    }
    
}

