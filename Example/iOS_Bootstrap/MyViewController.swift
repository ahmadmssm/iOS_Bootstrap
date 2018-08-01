//
//  MyViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MyViewController: BaseViewController<MyPresenter, MyViewControllerDelegator>, MyViewControllerDelegator, TableViewDelegates {
    
    @IBOutlet weak var usersTableVIew: UITableView!
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [User] = [User]()
    //
    private var mNavigator : NavigationCoordinator?
    var x : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initUI()
    }
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Set context
        AppDelegate.setContext(context: self)
    }
    
    func initUI() {
        mNavigator = self.navigator as? NavigationCoordinator
        // Setup tableview adapter
        tableAdapter.configureTableWithXibCell(tableView: usersTableVIew, dataSource: dataSource, nibClass: UserCell.self, delegate: self)
    }
    
    // Button actions
    @IBAction func TestButton(_ sender: UIButton) {
        presenter.getUsers(pageNumber: 1)
    }
    //
    @IBAction func testNavigator(_ sender: UIButton) {
        self.mNavigator?.startInitialView()
    }
    // Tableview adapter functions
    func configureCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell : UserCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.userID.text = String(describing: dataSource [indexPath.row].id!)
        cell.firstName.text = dataSource [indexPath.row].first_name
        cell.lastName.text = dataSource [indexPath.row].last_name
        return cell
    }
    //
    func loadMore(forPage page: Int, updatedDataSource: [Any]) {
        self.dataSource = updatedDataSource as! [User]
        presenter.getUsers(pageNumber: page)
    }
    
    // Delegate functions
    //
    func doNothing() {
        Log.info("I'm here...")
    }
    //
    func didGetFakeUsers(page: Page) {
        // Configure pagination parameters
        self.tableAdapter.configurePaginationParameters(totalNumberOfItems: page.total!, itemsPerPage: page.perPage!)
        // Reload table with new page items only (Not the whole data source)
        self.tableAdapter.reloadTable(pageItems: page.users!)
        // Update your data source
        self.dataSource.append(contentsOf: page.users!)
    }
    //
    func didFailToGetFakeUsers(error: String) {
        EZLoadingActivity.showWithDelay(error, disableUI: true, seconds: 3.0)
    }

    
    
   
    
}
