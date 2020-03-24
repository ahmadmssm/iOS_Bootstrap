//
//  WeatherTableViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class WeatherTableViewController<P>:
                                AppViewController<P, WeatherViewDelegate>,
                                WeatherForcastingAdapterProtocol,
                                WeatherViewDelegate
                                where P: WeatherPresenter {

    @IBOutlet private weak var tableView: UITableView!
    private var tableViewAdapter: WeatherTableViewAdapter!

    override func loadView() {
           Bundle.main.loadNibNamed("WeatherTableView", owner: self, options: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewAdapter = WeatherTableViewAdapter(tableView: tableView,
                                                   weatherForcastingAdapterProtocol: self)
    }

    override func localizeStrings() {}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = getTitle()
    }
    
    func getTitle() -> String {
        fatalError("`getTitle()` function should be implemented.")
    }
    
    func didGetFiveDaysWeather(weatherForcast: WeatherForcast) {
        tableViewAdapter.reloadTable(pageItems: weatherForcast.weatherForcastList!)
    }

    func didFailToGetFiveDaysWeather(errorMessage: String) {
        showError(errorMessage: errorMessage)
    }
    
    func didSelectRow(indexPath: IndexPath) {}
}
