//
//  ForecastWeather.swift
//  WeatherCast
//
//  Created by Nishant on 29/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import UIKit
import Alamofire

class ForecastWeather {
    
    var _day: String!
    var _weatherType: String!
    var _minTemp: Double!
    var _maxTemp: Double!
    
    var day: String {
        if _day == nil {
            _day = ""
        }
        return _day
    }
    
    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
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
    
    init(weatherDictionary: Dictionary<String, AnyObject>) {
        
        if let temp = weatherDictionary["temp"] as? Dictionary<String, AnyObject> {
            
            if let min = temp["min"] as? Double {
                let tempInCelcius = min - 273.15
                self._minTemp = tempInCelcius.roundTo(places: 2)
            }
            
            if let max = temp["max"] as? Double {
                let tempInCelcius = max - 273.15
                self._maxTemp = tempInCelcius.roundTo(places: 2)
            }
            
        }
        
        if let weather = weatherDictionary["weather"] as? [Dictionary<String, AnyObject>] {
            
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        
        //to get day from date
        if let date = weatherDictionary["dt"] as? Double {
            
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._day = unixConvertedDate.dayOfTheWeek()
        }

    }
}

//to get day from date
extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}

