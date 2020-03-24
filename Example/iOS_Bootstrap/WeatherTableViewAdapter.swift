//
//  WeatherTableViewAdapter.swift
//  iOS_Bootstrap_Example
//
//  Created by Ahmad Mahmoud on 3/24/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import iOS_Bootstrap

class WeatherTableViewAdapter: BaseTableViewAdapter<UITableView, Forcast> {
    
    private var weatherForcastingAdapterProtocol: WeatherForcastingAdapterProtocol!
    
    convenience init(tableView: UITableView,
                     weatherForcastingAdapterProtocol: WeatherForcastingAdapterProtocol) {
        self.init(tableView: tableView, xibCell: WeatherCell.self)
        self.weatherForcastingAdapterProtocol = weatherForcastingAdapterProtocol
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return initCell(cell: WeatherCell.self, indexPath: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weatherForcastingAdapterProtocol.didSelectRow(indexPath: indexPath)
    }
}
