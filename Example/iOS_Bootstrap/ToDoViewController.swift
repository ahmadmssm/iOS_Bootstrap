//
//  ToDoViewController.swift.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 12/21/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class ToDoViewController: MyMenuItemLiveTableViewController
                            <ToDoPresenter, ToDoViewDelegator, ToDoCellModel>,
                          ToDoViewDelegator, BaseTableViewDelegates {
    
    @IBOutlet private weak var tableView: UITableView!

    private var mode: ToDoMode!
    
    convenience init(mode: ToDoMode) {
        self.init()
        self.mode = mode
    }
        
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        switch mode {
        case .Active:
            
            break
        case .Done:
            
            break
        default: break
        }
    }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: ToDoCell.self, delegate: self)
    }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ToDoCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        return cell
    }
 
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
      //  getPresenter().getSummaryForMovieAt(index: indexPath.row)
    }
    
//    func didGetMovieSummary(summary: String) {
//        sclAlertView = SCLAlertView(appearance: sclAlertViewAppearance)
//        sclAlertView.showEdit("Movie summary", subTitle: summary)
//    }
//
//    func loadMore(tableView: UITableView, forPage page: Int, updatedDataSource: [Any]) {
//        getPresenter().getTrendingMovies(pageNumber: page)
//    }
//
//
//    func didFailToGetTrendingMovies(error: String) {
//        SCLAlertView().showError("Error", subTitle: error)
//    }

}
