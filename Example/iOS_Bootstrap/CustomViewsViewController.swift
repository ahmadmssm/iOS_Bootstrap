//
//  ViewController.swift
//  iOS_Bootstrap
//
//  Created by ams.eng@hotmail.com on 06/08/2018.
//  Copyright (c) 2018 ams.eng@hotmail.com. All rights reserved.
//

import iOS_Bootstrap

class CustomViewsViewController:
                    BaseViewController<CustomViewsPresenter, CustomViewsDelegator>,
                    CustomViewsDelegator {

    private let picker = Picker()
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    
    override func initUI() { self.title = "Custom views" }
    
    @IBAction func showProgress(_ sender: UIButton) {
        EZLoadingActivity.showWithDelay("Waiting...", disableUI: false, seconds: 2)
    }
    
    @IBAction func showDatePicker(_ sender: UIButton) {
       openDatePicker(sender: sender)
    }
    
    @IBAction func showTimePicker(_ sender: UIButton) {
        openTimePicker(sender: sender)
    }
    
    @IBAction func showLocalePicker(_ sender: UIButton) {
        openLocalePicer(sender: sender)
    }
    
    @IBAction func showArrayPicker(_ sender: UIButton) {
        openDataPicker(sender: sender)
    }
    
    @IBAction func showMultiArrayPicker(_ sender: UIButton) {
        openMultiDatasourcePicker(sender: sender)
    }
    
    @IBAction func showDateAndTimePicker(_ sender: UIButton) {
        openDateAndTimePicker(sender: sender)
    }
    
    @IBAction func showToast(_ sender: UIButton) {
        self.view.makeToast("This is a piece of toast", duration: 3.0, position: .center)
    }

    @IBAction func loggers(_ sender: UIButton) {
        Log.info("Hi, I'm a logger that prints what you want in Xcode console and i work in debug mode only")
    }
    
    func openMultiDatasourcePicker(sender : UIButton) {
        let dataSource : [[String]] = [["One", "Two", "A lot"], ["Many", "Many more", "Infinite"],["One", "Two", "A lot"]]
        picker.showMutiDataSelectionPicker(sender: sender, title: "", dataSource: dataSource, initislSelection: [0,0,0], okButton: nil, cancelButton: nil) { (position, result) in
            Log.info("Data " + String(position[0]))
        }
    }
    
    func openLocalePicer(sender : UIButton) {
        picker.showLocalePicker(sender: sender, title: "Locale picker", initislSelection: 0, currentLocaleButtonTitle: nil, okButton: nil, cancelButton: nil) { (timeZone) in
        }
    }
    
    func openDataPicker(sender : UIButton) {
        let rightButton = UIButton(frame: CGRect(x:0,y:0,width:30,height:30))
        rightButton.titleLabel?.font.withSize(22)
        rightButton.setTitle("Cancel", for: .normal)
        rightButton.setTitleColor(UIColor.red, for: .normal)
        
        let dataSource : [String] = ["One", "Two", "A lot"]
        
        picker.showDataSelectionPicker(sender: sender, title: "Dropdown", dataSource: dataSource, initislSelection: 0, okButton: nil, cancelButton: rightButton) { (data) in
        }
    }
    
    func openTimePicker(sender : UIButton) {
        picker.showTimePicker(sender: sender, title: "", currentLocaleButtonTitle: nil, okButton: nil, cancelButton: nil) { (date) in
            Log.info(date)
        }
    }
    
    func openDateAndTimePicker(sender : UIButton) {
        picker.showDateTimePicker(sender: sender, title: "", minimumDate: nil, maximumDate: nil, currentLocaleButtonTitle: nil, okButton: nil, cancelButton: nil) { (date) in
            Log.info(date)
        }
    }

    func openDatePicker(sender : UIButton) {
        let rightButton = UIButton(frame: CGRect(x:0,y:0,width:30,height:30))
        rightButton.titleLabel?.font.withSize(22)
        rightButton.setTitle("Ok", for: .normal)
        rightButton.setTitleColor(UIColor.blue, for: .normal)
        //
        picker.showDatePicker(sender: sender, title: "", minimumDate: nil, maximumDate: nil, currentLocaleButtonTitle: nil, okButton: rightButton, cancelButton: nil) { (date) in
            Log.info(date)
        }
    }
    
}




