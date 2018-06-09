//
//  ViewController.swift
//  iOS_Bootstrap
//
//  Created by ams.eng@hotmail.com on 06/08/2018.
//  Copyright (c) 2018 ams.eng@hotmail.com. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func buttonGoToHomeStoryboard(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.getStoryboardWithName(Storyboard.home.rawValue)
        let homeVC = storyboard.instantiateInitialViewController() as! HomeVC
        homeVC.x = 2
        present(homeVC, animated: true, completion: nil)
    }
    
}

