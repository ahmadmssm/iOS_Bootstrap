//
//  Navigator.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 7/11/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class Navigator: BaseNavigator {
    //
    static func goToHomeStoryBoard(number : Int) {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as MyViewController
        vc.x = number
        getContext().present(vc, animated: true, completion: nil)
    }
    
    //
    static func goToExambleOfTableViewCOntroller() {
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as TableExampleView
        getContext().navigationController?.pushViewController(vc, animated: false)
    }
    
    static func startInitialView() {
        // Write initial (first) view controller navigation here
        let storyboard =  UIStoryboard.getStoryboardWithName(Storyboards.main)
        let vc = storyboard.instantiateViewController() as ViewController
        navigationController?.pushViewController(vc, animated: false)
    }
    
}
