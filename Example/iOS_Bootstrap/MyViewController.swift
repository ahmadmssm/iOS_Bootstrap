//
//  MyViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MyViewController: BaseViewController<MyPresenter, MyProtocol>, MyProtocol, TableViewDelegates {
    
    @IBOutlet weak var usersTableVIew: UITableView!
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [User] = [User]()
    //
    private var mNavigator : NavigationCoordinator?
    var x : Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mNavigator = self.navigator as? NavigationCoordinator
        AppDelegate.setContext(context: self)
        //
        tableAdapter.configureTableWithXibCell(tableView: usersTableVIew, dataSource: dataSource, nibClass: UserCell.self, delegate: self)
    }
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        self.getUsers(pageNumber: 1)
    }
    
    @IBAction func TestButton(_ sender: UIButton) {
       self.presenter.test()
    }

    func doNothing() {
        Log.info("I'm here...")
    }
    
    @IBAction func testNavigator(_ sender: UIButton) {
        self.mNavigator?.startInitialView()
    }
    
    func configureCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell : UserCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.userID.text = String(describing: dataSource [indexPath.row].id!)
        cell.firstName.text = dataSource [indexPath.row].first_name
        cell.lastName.text = dataSource [indexPath.row].last_name
        return cell
    }
    
    private func getUsers(pageNumber : Int) {
        API_Connector().getFakeUsers(page: pageNumber, completion: { response in
            switch response {
            case .success(let userPage):
                // Configure pagination parameters
                self.tableAdapter.configurePaginationParameters(totalNumberOfItems: userPage.total!, itemsPerPage: userPage.per_page!)
                // Reload table with new page items only (Not the whole data source)
                self.tableAdapter.reloadTable(pageItems: userPage.data!)
                // Update your data source
                self.dataSource.append(contentsOf: (userPage.data)!)
                //
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }
    
    func loadMore(forPage page: Int, updatedDataSource: [Any]) {
        self.dataSource = updatedDataSource as! [User]
        getUsers(pageNumber: page)
    }
    
}
