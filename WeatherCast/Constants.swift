//
//  Constants.swift
//  WeatherCast
//
//  Created by Nishant on 28/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import Foundation

//file to hold url details to fetch weather data

let API_KEY = "PUT-YOUR-API-KEY-HERE"

//to make sure to stop downloading, when data is downloaded completed
typealias DownloadComplete = () -> ()

let CURRENT_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=\(API_KEY)"

let FORECAST_WEATHER_URL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&cnt=10&mode=json&appid=\(API_KEY)"

