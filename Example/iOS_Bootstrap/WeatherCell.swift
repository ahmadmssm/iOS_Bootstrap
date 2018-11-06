//
//  WeatherCell.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 11/6/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit
import iOS_Bootstrap

class WeatherCell: BaseTableViewCell {
    @IBOutlet weak var labelTemperature: UILabel!
    @IBOutlet weak var labelMinTemperature: UILabel!
    @IBOutlet weak var labelMaxTemp: UILabel!
    @IBOutlet weak var labelWindSpeed: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelPressure: UILabel!
    @IBOutlet weak var labelHumidity: UILabel!
    @IBOutlet weak var imageViewWeather: UIImageView!
}
