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
        
        //request Alamofire to response in JSON, i.e to provide data in JSON format
        Alamofire.request(CURRENT_WEATHER_URL).responseJSON { response in
            
            //the JSON data is downloaded in "response"
            let result = response.result
            
            //parsing data from JSON
            if let dictionary = result.value as? Dictionary<String, AnyObject> {
                
                //set city name
                if let name = dictionary["name"] as? String {
                    self._cityName = name
                    print(self._cityName)
                }
                
                //weather is an array of type Dictionary
                if let weather = dictionary["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main
                        print(self._weatherType)
                    }
                }
                
                if let main = dictionary["main"] as? Dictionary<String, AnyObject> {
                    if let temp = main["temp"] as? Double {
                        
                        let tempInCelcius = temp - 273.15
                        self._currentTemp = tempInCelcius
                        print(self._currentTemp)
                    }
                }
                
            }
            completed()
        }
    }
}


