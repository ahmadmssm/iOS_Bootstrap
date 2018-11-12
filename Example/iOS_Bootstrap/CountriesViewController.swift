//
//  CountriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import iOS_Bootstrap
import SVGKit
import SCLAlertView

class CountriesViewController:
    MyMenuItemTableViewController<CountriesPresenter,
    CountriesViewDelegator, Country>,
    CountriesViewDelegator,
    BaseTableViewDelegates {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() { self.title = "World countries" }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: CountriesCell.self, delegate: self)
        //
        getTableViewAdapter().reloadTable()
        Skeleton.addTo(self.tableView)
    }
    
    func configureNumberOfRowsForSection(tableView: UITableView, section: Int) -> Int {
        if (getTableViewDataSource.count > 0) { return getTableViewDataSource.count }
        return 4
    }
    
    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CountriesCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        if (getTableViewDataSource.count > 0) {
            cell.labelCountryName.text = getTableViewDataSource[indexPath.row].countryName!
            cell.labelCapitalName.text = getTableViewDataSource[indexPath.row].capital
            cell.labelRegion.text = getTableViewDataSource[indexPath.row].region
            cell.labelTimeZone.text = getTableViewDataSource[indexPath.row].timeZones?[0]
            //
            let flagURL = URL(string: getTableViewDataSource[indexPath.row].flag!)
            let flagImage: SVGKImage = SVGKImage(contentsOf: flagURL)
            cell.imageViewFlag.image = flagImage.uiImage
        }
        return cell
    }
    
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {
        Navigator.goToCountryDetailsViewController(country: getTableViewDataSource[indexPath.row])
    }
    
    func emptyDataSetShouldDisplay() -> Bool { return self.isEmptyDataSource }
    
    func emptyDataSetDescriptionText() -> NSAttributedString {
        let attributes: [NSAttributedStringKey : Any] = [
            NSAttributedStringKey.strokeColor : UIColor.black,
            NSAttributedStringKey.foregroundColor : UIColor.blue,
            NSAttributedStringKey.strokeWidth : -2.0,
            NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)
        ]
        return NSAttributedString(string: "No data !", attributes: attributes)
    }

    func didGetCountries(countries: [Country]) {
        getTableViewAdapter().reloadTable(pageItems: countries)
        Skeleton.removeFrom(self.tableView)
        if (getTableViewDataSource.count == 0) {
            self.isEmptyDataSource = true
            getTableViewAdapter().reloadTable()
        }
    }
    
    func didFailToGetCountries(error: String) {
        SCLAlertView().showError("Error", subTitle: error)
    }
    
}
