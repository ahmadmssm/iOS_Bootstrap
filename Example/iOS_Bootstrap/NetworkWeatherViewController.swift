//
//  NetworkWeatherViewController.swift
//  SlideMenuControllerSwift
//
//  Created by Yuji Hato on 1/19/15.
//  Copyright (c) 2015 Yuji Hato. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class NetworkWeatherViewController: MyMenuItemTableViewController<NetworkWeatherPresenter, NetworkWeatherViewDelegator, Forcast>, NetworkWeatherViewDelegator, BaseTableViewDelegates {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initUI() { self.title = "Network weather " }
    
    override func viewWillAppear(_ animated: Bool) { super.viewWillAppear(animated) }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: tableView, nibClass: WeatherCell.self, delegate: self)
    }
    
    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WeatherCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        
        // let weatherObj = getTableViewDataSource[indexPath.row].main?.temp

        cell.labelTemperature.text = getTableViewDataSource[indexPath.row].main?.temp?.toString()
        cell.labelMaxTemp.text = getTableViewDataSource[indexPath.row].main?.tempMax?.toString()
        cell.labelMinTemperature.text = getTableViewDataSource[indexPath.row].main?.tempMin?.toString()
         cell.labelWindSpeed.text = getTableViewDataSource[indexPath.row].wind?.speed?.toString()
        cell.labelDate.text = getTableViewDataSource[indexPath.row].date
        cell.labelPressure.text = getTableViewDataSource[indexPath.row].main?.pressure?.toString()
        cell.labelHumidity.text = getTableViewDataSource[indexPath.row].main?.humidity?.toString()
        //
        let iconURL : String = (getTableViewDataSource[indexPath.row].additionalData?[0].icon)!
        let fullURL = URL(string: "http://openweathermap.org/img/w/" + iconURL + ".png")
        //
        cell.imageViewWeather.kf.setImage(with: fullURL)
        //
        return cell
    }
    
    func didGetTenDaysWeather(weatherForcast: WeatherForcast) {
        getTableViewAdapter().reloadTable(pageItems: weatherForcast.weatherForcastList!)
    }
    
    func didFailToGetTenDaysWeather(errorMessage: String) {}
    
}

