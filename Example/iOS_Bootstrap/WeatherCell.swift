//
//  WeatherCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class WeatherCell: BaseGenericTableViewCell<Forcast> {
    
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelMinTemperature: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    @IBOutlet weak var labelWindSpeed: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var imageViewWeather: UIImageView!
    
    override func initCellFrom(cellModel: Forcast) {
        if let temp = cellModel.main?.temp?.toString() {
            labelTemperature.text = "Temp. : " + temp + " C"
        }
        if let maxTemp = cellModel.main?.tempMax?.toString() {
            labelMaxTemp.text = "Max. temp. : " + maxTemp + " C"
        }
        if let minTemp = cellModel.main?.tempMin?.toString() {
            labelMinTemperature.text = "Max. temp. : " + minTemp + " C"
        }
        if let windSpeed = cellModel.wind?.speed?.toString() {
            labelWindSpeed.text = "Wind speed : " + windSpeed + " km/h"
        }
        if let dateString = cellModel.date {
            labelDate.text = "Date : " + DateTimeHelpers.formatDateString(dateString: dateString)!
        }
        if let pressure = cellModel.main?.pressure?.toString() {
            labelPressure.text = "Pressure : " + pressure
        }
        if let humidity = cellModel.main?.humidity?.toString() {
            labelHumidity.text = "Humidity : " + humidity
        }
        if let iconURL = cellModel.additionalData?[0].icon {
            let fullURL = URL(string: "http://openweathermap.org/img/w/" + iconURL + ".png")
            imageViewWeather.loadImage(with: fullURL!)
        }
    }
    
}
