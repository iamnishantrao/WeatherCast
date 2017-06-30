//
//  CurrentWeather.swift
//  WeatherCast
//
//  Created by Nishant on 28/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import UIKit
import Alamofire

//class to hold current weather data
class CurrentWeather {
    
    var _cityName: String!
    var _weatherType: String!
    var _currentTemp: Double!
    var _minTemp: Double!
    var _maxTemp: Double!
    
    //TODO: code to handle current date
    //var _date: String!
    
    //these are implemented to handle errors if the variables are empty
    var cityName: String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    var minTemp: Double {
        if _minTemp == nil {
            _minTemp = 0.0
        }
        return _minTemp
    }
    
    var maxTemp: Double {
        if _maxTemp == nil {
            _maxTemp = 0.0
        }
        return _maxTemp
    }
    
//    var date: String {
//        if _date == nil {
//            _date = ""
//        }
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateStyle = .full //(.full shows complete date)
//        dateFormatter.timeStyle = .none
//        let currentDate = dateFormatter.string(from: Date())
//        self._date = "Today \(currentDate)"
//        
//        return _date
//    }
    
    
    //download data from url
    func downloadWeatherData(completed: @escaping DownloadComplete) {
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        
        //request Alamofire to response in JSON, i.e to provide data in JSON format
        Alamofire.request(currentWeatherURL).responseJSON { response in
            
            //the JSON data is downloaded in "response"
            let result = response.result
            
            //parsing data from JSON
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                //set city name
                if let name = dictionary["name"] as? String {
                    self._cityName = name
                }
                
                //weather is an array of type Dictionary
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                    }
                }
                
                if let main = dictionary["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        
                        let tempInCelcius = temp - 273.15
                        self._currentTemp = tempInCelcius.roundTo(places: 2)
                    }
                    
                    if let temp_min = main["temp_min"] as? Double {
                        let tempInCelcius = temp_min - 273.15
                        self._minTemp = tempInCelcius.roundTo(places: 2)
                    }
                    
                    if let temp_max = main["temp_max"] as? Double {
                        let tempInCelcius = temp_max - 273.15
                        self._maxTemp = tempInCelcius.roundTo(places: 2)
                    }

                }
                
            }
            completed()
        }
    }
}

//to round temperature to two decimal places
extension Double {

    func roundTo(places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}


