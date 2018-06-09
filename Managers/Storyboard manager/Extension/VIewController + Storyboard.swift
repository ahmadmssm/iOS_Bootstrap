//
//  UIStoryboard+Storyboards.swift
//  AHStoryboard
//
//  Created by Andyy Hope on 19/01/2016.
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
    
    // MARK: - Convenience Initializers
    convenience init(storyboard: String, bundle: Bundle? = nil) {
        self.init(name: storyboard.capitalized, bundle: bundle)
    }
    
    // MARK: - Class Functions
    open class func getStoryboardNamed(_ storyboard: String, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.capitalized, bundle: bundle)
    }
    
    // MARK: - View Controller Instantiation from Generics
    public func instantiateViewController<T: UIViewController>() -> T where T: StoryboardIdentifiable {
    guard let viewController = self.instantiateViewController(withIdentifier: T.storyboardIdentifier) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(T.storyboardIdentifier) ")
        }
        return viewController
    }
}

