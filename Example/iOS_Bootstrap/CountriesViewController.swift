//
//  CountriesViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import iOS_Bootstrap
import SVGKit
import SCLAlertView
import RxSwift
import RxCocoa

@available(iOS 10.0, *)
class CountriesViewController:
                        MyMenuItemTableViewController<CountriesPresenter,
                        CountriesViewDelegator, CountryEntity>,
                        CountriesViewDelegator,
                        BaseTableViewDelegates {
    
    @IBOutlet weak private var tableView: UITableView!
    //
    private let disposeBag: DisposeBag!
    private let svgImageHelper: SVGimageHelper!
  
    required init?(coder aDecoder: NSCoder) {
        disposeBag = DisposeBag()
        svgImageHelper = SVGimageHelper()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() {
        //
        self.title = "World countries"
        //
        if #available(iOS 11.0, *) {
            //
            let searchController = NoCancelButtonSearchController(searchResultsController: nil)
            // Customise search controller
            searchController.hidesNavigationBarDuringPresentation = false
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
            navigationController?.hidesBarsWhenKeyboardAppears = false
            // searchController.searchBar.setValue("Search", forKey: "cancelButtonText")
            // Search bar
            let searchBar = searchController.searchBar
            // This property is mandatory for the cncel button call back to work, otherwise it wont work.
            // Ref : https://stackoverflow.com/questions/48090329/search-bar-cancel-button-delegate-not-called
            self.definesPresentationContext = true
            // Customise search bar
            searchBar.tintColor = UIColor.white
            searchBar.barTintColor = UIColor.white
            if let textfield = searchBar.value(forKey: "searchField") as? UITextField {
                textfield.textColor = UIColor.blue
                if let backgroundview = textfield.subviews.first {
                    // Background color
                    backgroundview.backgroundColor = UIColor.white
                    // Rounded corner
                    backgroundview.layer.cornerRadius = 15
                    backgroundview.clipsToBounds = true
                }
            }
            //
            let gradient : CAGradientLayer = CAGradientLayer()
            gradient.frame = searchBar.bounds
            gradient.colors = [UIColor.red.cgColor, UIColor.blue.cgColor]
            gradient.startPoint = CGPoint(x: 0, y: 0)
            gradient.endPoint = CGPoint(x: 1, y: 0)
            if let gardientImage = UIImage.getGradientImageFrom(gradientLayer: gradient) {
                navigationController?.navigationBar.barTintColor = UIColor(patternImage: gardientImage)
            }
            // Add search controller to navigation controller
            navigationItem.searchController = searchController
            // Customise navigation bar
            navigationItem.hidesSearchBarWhenScrolling = false
            //
            searchBar
                .rx
                .text
                .orEmpty
                .debounce(1.5, scheduler: Schedulers.uiScheduler)
                // Only emits if the current value is different than the last one
                .distinctUntilChanged()
                .subscribe(onNext: { searchText in
                    // Here we will be notified of every new value
                    self.getPresenter().findCountriesWith(name: searchText, currentDataSource: self.getTableViewDataSource)
                })
                .disposed(by: disposeBag)
        }
    }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: CountriesCell.self, delegate: self)
        //
        getTableViewAdapter().reloadTable()
        Skeleton.addTo(self.tableView)
    }
    
    func configureNumberOfRowsForSection(tableView: UITableView, section: Int) -> Int {
        if (getTableViewDataSource.count > 0) {
            return getTableViewDataSource.count
        }
        return 4
    }
    
    func withExpandableCell() -> Bool { return true }
    
    func configureCellForRow(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CountriesCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        //
        if (getTableViewDataSource.count > 0) {
            cell.labelCountryName.text = getTableViewDataSource[indexPath.row].name!
            cell.labelCapitalName.text = getTableViewDataSource[indexPath.row].capital
            cell.labelRegion.text = getTableViewDataSource[indexPath.row].continental
            cell.labelTimeZone.text = getTableViewDataSource[indexPath.row].timeZone
            //
            // let flagURL = URL(string: getTableViewDataSource[indexPath.row].flagURL!)
            // let flagImage: SVGKImage = SVGKImage(contentsOf: flagURL)
            // cell.imageViewFlag.image = flagImage.uiImage
            
            
//            _ = svgImageHelper.loadFrom(svgImageURL: getTableViewDataSource[indexPath.row].flagURL!)
//                .do(onNext: { image in cell.imageViewFlag.image = image },
//                    onError: { error in cell.imageViewFlag.image = #imageLiteral(resourceName: "image_not_found")}, onCompleted: {},
//                    onSubscribe: {}, onSubscribed: {}, onDispose: {})
//                .subscribe()
//                .disposed(by: disposeBag)
            
            let flagURL: String = getTableViewDataSource[indexPath.row].flagURL!
            cell.imageViewFlag.loadSVGfrom(url: flagURL, disposeBag: disposeBag)
            
        }
        return cell
    }
    
    func rowDidSelected(tableView: UITableView, indexPath: IndexPath) {}
    
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

    func didGetCountries(countries: [CountryEntity]) {
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
    
    func didFailToSaveCountriesInCoreData(error: String) {
        
    }
    
    func didGetSearchResults(filteredCountries: [CountryEntity]) {
        getTableViewAdapter().setDataSource(dataSource: [])
        getTableViewAdapter().setDataSource(dataSource: filteredCountries)
        getTableViewAdapter().reloadTable()
    }
    
    func didResetCountriesTable(countries: [CountryEntity]) {
//        getTableViewAdapter().reloadTable(pageItems: countries)
        getTableViewAdapter().reloadSinglePageTable(items: countries)
    }
    
}
