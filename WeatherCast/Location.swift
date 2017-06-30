//
//  Location.swift
//  WeatherCast
//
//  Created by Nishant on 30/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import CoreLocation

//singleton class to hold location coordinates
class Location {
    static var sharedInstance = Location()
    
    private init() { }
    
    var latitude: Double!
    var longitude: Double!
}
