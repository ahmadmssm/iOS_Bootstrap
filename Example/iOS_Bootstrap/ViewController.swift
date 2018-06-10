//
//  ViewController.swift
//  iOS_Bootstrap
//
//  Created by ams.eng@hotmail.com on 06/08/2018.
//  Copyright (c) 2018 ams.eng@hotmail.com. All rights reserved.
//  Ref : https://stackoverflow.com/questions/25738817/removing-duplicate-elements-from-an-array

/*
 
 How to use :
 
 let arrayOfInts = [2, 2, 4, 4]
 
 Remove duplicates :
 print(arrayOfInts.removeDuplicates()) // Prints: [2, 4]
 
 Filtering based on properties :
 let filteredElements = myElements.filterDuplicates { $0.PropertyOne == $1.PropertyOne && $0.PropertyTwo == $1.PropertyTwo }
 
*/

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
    
    @IBAction func showProgress(_ sender: UIButton) {
        EZLoadingActivity.showWithDelay("Waiting...", disableUI: false, seconds: 2)
    }
    
    @IBAction func showPicker(_ sender: UIButton) {
        Log.d("Hi !")
        Log.e("There is an error :(")
    }
    
}

