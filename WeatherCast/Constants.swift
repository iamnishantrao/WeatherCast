//
//  Constants.swift
//  WeatherCast
//
//  Created by Nishant on 28/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import Foundation

//file to hold url details to fetch weather data


//for current weather data
let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let FORECAST_URL = "https://api.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let COUNT = "&cnt="
let APP_ID = "&appid="
let APP_KEY = "ENTER-YOUR-APP-KEY-HERE"
//for forecast weather data



//to make sure to stop downloading, when data is downloaded completed
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)28.4595\(LONGITUDE)77.0266\(APP_ID)\(APP_KEY)"

let FORECAST_WEATHER_URL = "\(FORECAST_URL)\(LATITUDE)28.4595\(LONGITUDE)77.0266\(COUNT)6\(APP_ID)\(APP_KEY)"
