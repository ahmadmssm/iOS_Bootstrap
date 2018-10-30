//
//  MyViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//
// Ref : https://stackoverflow.com/questions/27960556/loading-an-overlay-when-running-long-tasks-in-ios
//

import UIKit
import iOS_Bootstrap

class MyViewController:
                BaseTableViewController<MyPresenter, MyViewControllerDelegator, User>,
                MyViewControllerDelegator,
                BaseTableViewDelegates {
    //
    @IBOutlet weak var switchLanguageButton: UIButton!
    @IBOutlet weak var usersTableVIew: UITableView!
    //
    var x : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Log.debug(GlobalKeys.getEnvironmentVariables.baseURL)
    }
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        Log.debug("ChangeLng".localized())
        switchLanguageButton.setTitle("ChangeLng".localized(), for: .normal)
    }
    
    override func initUI() {}
        
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter.configureTableWithXibCell(tableView: usersTableVIew, nibClass: UserCell.self, delegate: self)
    }
    
    // Button actions
    @IBAction func TestButton(_ sender: UIButton) {
        getPresenter.getUsers(pageNumber: 1)
       // getPresenter.getErrorFromRequest()
    }
    //
    @IBAction func testNavigator(_ sender: UIButton) {
        // self.mNavigator?.startInitialView()
        let langMgr : MultiLanguageManager = MultiLanguageManager()
        if (langMgr.getCurrentAppLanguage() == Languages.Arabic.rawValue) {
            langMgr.switchAppLanguageInstantly(language: Languages.English)
        }
        else {
           langMgr.switchAppLanguageInstantly(language: Languages.Arabic)
        }
        
     //   let window = (UIApplication.shared.delegate as! AppDelegate).window
     //   let storyboard = UIStoryboard.getStoryboardWithName(Storyboards.main)
      //  window?.rootViewController = storyboard.instantiateViewController(withIdentifier: "root")
        
     //   UIView.transition(with: window!, duration: 0.5, options: .transitionCrossDissolve, animations: nil, completion: nil)
        //
        // Or
        //
        let windows = UIApplication.shared.windows
//        // Get the current app window without casting to app delegate
        for window in windows {
            for view in window.subviews {
                view.removeFromSuperview()
                window.rootViewController = Navigator.navigationController
                window.addSubview(view)
           }
        }
        navigationController?.popViewController(animated: true)
    }
    
    // Tableview adapter functions
    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UserCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.userID.text = String(describing: getTableViewDataSource [indexPath.row].id!)
        cell.firstName.text = getTableViewDataSource [indexPath.row].first_name
        cell.lastName.text = getTableViewDataSource [indexPath.row].last_name
        return cell
    }
    //
    func loadMore(forPage page: Int, updatedDataSource: [Any]) {
        getPresenter.getUsers(pageNumber: page)
    }
    
    //
    func doNothing() { Log.info("I'm here...") }
    //
    
    func didGetFakeUsers(page: Page) {
        // Configure pagination parameters
        getTableViewAdapter.configurePaginationParameters(totalNumberOfItems: page.total!, itemsPerPage: page.perPage!)
        // Reload table with new page items only (Not the whole data source)
        getTableViewAdapter.reloadTable(pageItems: page.users!)
    }
    //
    func didFailToGetFakeUsers(error: String) {
        showEZloadinActivityWithDuration(message: error, cancelable: true, seconds: 3.0)
    }

}
