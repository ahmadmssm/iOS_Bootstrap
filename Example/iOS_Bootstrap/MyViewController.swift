//
//  MyViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 6/30/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class MyViewController: BaseViewController<MyPresenter>, MyProtocol, TableViewDelegates {
    
    //
    @IBOutlet weak var usersTableVIew: UITableView!
    private let tableAdapter : TableviewAdapter = TableviewAdapter()
    private var dataSource : [User] = [User]()
    private var pageNumber : Int = 1
    //
    var mNavigator : NavigationCoordinator?
    var x : Int?
    
    
    func getUsers() {
        API_Connector().getFakeUsers(page: pageNumber, completion: { response in
            switch response {
            case .success(let page):
                let userPage : Page  = page
                //
                self.tableAdapter.configurePaginationParameters(totalNumberOfItems: userPage.total!, itemsPerPage: userPage.per_page!)
                self.tableAdapter.reloadTable(pageItems: userPage.data!, currentPage: self.pageNumber)
                //
                self.dataSource.append(contentsOf: userPage.data!)
                self.pageNumber += 1
                //
                break
            case .failure(let errorMsg):
                print("Error : " + errorMsg)
                break
            }
        })
    }
    
    func loadMore() {
        getUsers()
    }
    
    func configureCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //
        let cell : UserCell = usersTableVIew.dequeueReusableCell(forIndexPath: indexPath)
        cell.userID.text = String(describing: dataSource [indexPath.row].id!)
        cell.firstName.text = dataSource [indexPath.row].first_name
        cell.lastName.text = dataSource [indexPath.row].last_name
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mNavigator = self.navigator as? NavigationCoordinator
        //
        AppDelegate.setContext(context: self)
        tableAdapter.configureTableWithXibCell(tableView: usersTableVIew, dataSource: dataSource, nibClass: UserCell.self, delegate: self)
        //
       //  Log.debug(x!)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //
        self.getUsers()
    }
    
    @IBAction func TestButton(_ sender: UIButton) {
      //  self.presenter.test()
        if (5.3 - round(5.3) < 0) {
            print("Rount test ", round(5.3) + 1)
        }
    }
    
    func doNothing() {
        Log.info("I'm here...")
    }

    @IBAction func testNavigator(_ sender: UIButton) {
        self.mNavigator?.startInitialView()
    }
}
