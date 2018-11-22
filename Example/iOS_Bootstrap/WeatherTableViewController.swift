//
//  WeatherTableViewController.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/7/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import iOS_Bootstrap
import SCLAlertView
import AFDateHelper

class WeatherTableViewController <T, V>:
            BaseTableViewController<T, V, Forcast>,
            BaseTableViewDelegates,
            WeatherViewDelegator
            where T : BasePresenter<V> {
    
    override func viewDidLoad() { super.viewDidLoad() }
    
    override func initTableViewAdapterConfiguraton() {
        getTableViewAdapter().configureTableWithXibCell(tableView: getTableView(), nibClass: WeatherCell.self, delegate: self)
    }
    
    func getTableView() -> UITableView {
        fatalError("Must Override")
    }
    
    func configureTableViewCell(tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : WeatherCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
        cell.labelTemperature.text = "Temp. : " + (getTableViewDataSource[indexPath.row].main?.temp?.toString())! + " C"
        cell.labelMaxTemp.text = "Max. temp. : " + (getTableViewDataSource[indexPath.row].main?.tempMax?.toString())! + " C"
        cell.labelMinTemperature.text = "Min. temp. : " + (getTableViewDataSource[indexPath.row].main?.tempMin?.toString())! + " C"
        cell.labelWindSpeed.text = "Wind speed : " + (getTableViewDataSource[indexPath.row].wind?.speed?.toString())! + " km/h"
        //
        let dateString = getTableViewDataSource[indexPath.row].date!
        let date = Date(fromString: dateString, format: .custom("yyyy-MM-dd HH:mm:ss"))
        let dateFormat : String = "EEE, dd MMM yyyy hh:mm a"
        //
        cell.labelDate.text = "Date : " + (date?.toString(format: .custom(dateFormat)))!
        cell.labelPressure.text = "Pressure : " +
            (getTableViewDataSource[indexPath.row].main?.pressure?.toString())!
        cell.labelHumidity.text = "Humidity : " +
            (getTableViewDataSource[indexPath.row].main?.humidity?.toString())!
        //
        let iconURL : String = (getTableViewDataSource[indexPath.row].additionalData?[0].icon)!
        let fullURL = URL(string: "http://openweathermap.org/img/w/" + iconURL + ".png")
        //
        cell.imageViewWeather.loadImage(with: fullURL!)
        //
        return cell
    }
    
    func didGetFiveDaysWeather(weatherForcast: WeatherForcast) {
        getTableViewAdapter().reloadTable(pageItems: weatherForcast.weatherForcastList!)
    }
    
    func didFailToGetFiveDaysWeather(errorMessage: String) {
        SCLAlertView().showError("Error", subTitle: errorMessage)
    }
    
}
