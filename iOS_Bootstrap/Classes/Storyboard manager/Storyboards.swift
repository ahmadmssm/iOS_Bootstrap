//
//  Storyboards.swift
//  ReusableTableView
//
//  Created by Ahmad Mahmoud on 5/13/18.
//  Copyright © 2018 Ahmad Mahmoud. All rights reserved.
//

import UIKit

extension UIStoryboard {
    
    /// The uniform place where we state all the storyboard we have in our application
    enum Storyboard: String {
        case main
//        case news
//        case gallery
        
        
        //
        var filename: String {
            return rawValue.capitalized
        }
    }
}

