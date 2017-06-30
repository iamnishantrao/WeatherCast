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
let BASE_URL = "http://samples.openweathermap.org/data/2.5/weather?"
let FORECAST_URL = "http://samples.openweathermap.org/data/2.5/forecast/daily?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let COUNT = "&cnt="
let APP_ID = "&appid="
let APP_KEY = "b1b15e88fa797225412429c1c50c122a1"

//to make sure to stop downloading, when data is downloaded completed
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(APP_KEY)"

let FORECAST_WEATHER_URL = "\(FORECAST_URL)\(LATITUDE)35\(LONGITUDE)139\(COUNT)6\(APP_ID)\(APP_KEY)"

