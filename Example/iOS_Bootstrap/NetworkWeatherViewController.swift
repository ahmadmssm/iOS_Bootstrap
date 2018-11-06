//
//  NetworkWeatherViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class NetworkWeatherViewController: BaseTableViewController<NetworkWeatherPresenter, NetworkWeatherViewDelegator, Forcast>, NetworkWeatherViewDelegator, BaseTableViewDelegates {
    
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
        
        cell.labelTemperature.text = "Temp. : " + (getTableViewDataSource[indexPath.row].main?.temp?.toString())! + " C"
        cell.labelMaxTemp.text = "Max. temp. : " + (getTableViewDataSource[indexPath.row].main?.tempMax?.toString())! + " C"
        cell.labelMinTemperature.text = "Min. temp. : " + (getTableViewDataSource[indexPath.row].main?.tempMin?.toString())! + " C"
        cell.labelWindSpeed.text = "Wind speed : " + (getTableViewDataSource[indexPath.row].wind?.speed?.toString())! + " km/h"
        cell.labelDate.text = "Date : " + getTableViewDataSource[indexPath.row].date!
        cell.labelPressure.text = "Pressure : " + (getTableViewDataSource[indexPath.row].main?.pressure?.toString())!
        cell.labelHumidity.text = "Humidity : " +
            (getTableViewDataSource[indexPath.row].main?.humidity?.toString())!
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
