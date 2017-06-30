//
//  WeatherCell.swift
//  WeatherCast
//
//  Created by Nishant on 30/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var forecastWeatherImage: UIImageView!
    @IBOutlet weak var forecastDay: UILabel!
    @IBOutlet weak var forecastWeatherType: UILabel!
    @IBOutlet weak var forecastMaxTemp: UILabel!
    @IBOutlet weak var forecastMinTemp: UILabel!
    
    //function to set forecasr weather data in cell
    func configureCell(forecastWeather: ForecastWeather) {
     
        forecastWeatherType.text = forecastWeather.weatherType
        forecastWeatherImage.image = UIImage(named: forecastWeather.weatherType)
        forecastMinTemp.text = "\(forecastWeather.minTemp)"
        forecastMaxTemp.text = "\(forecastWeather.maxTemp)"
        forecastDay.text = forecastWeather.day
        
    }
}
