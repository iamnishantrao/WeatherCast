//
//  Constants.swift
//  WeatherCast
//
//  Created by Nishant on 28/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import Foundation

//file to hold url details to fetch weather data

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let APP_KEY = "a18c870da3516006c9ad0dea20843b43"

//to make sure to stop downloading, when data is downloaded completed
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)28.4595\(LONGITUDE)77.0266\(APP_ID)\(APP_KEY)"
