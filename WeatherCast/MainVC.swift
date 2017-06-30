//
//  MainVC.swift
//  WeatherCast
//
//  Created by Nishant on 27/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentWeatherCondition: UILabel!
    @IBOutlet weak var todaysMinTemp: UILabel!
    @IBOutlet weak var todaysMaxTemp: UILabel!
    @IBOutlet weak var forecastTableView: UITableView!
    
    //for current location of user
    let locationManager = CLLocationManager()
    var userLocation: CLLocation!
    
    var currentWeather: CurrentWeather!
    var forecast: ForecastWeather!
    var forecastData = [ForecastWeather]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting delegate for locationManager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        //setting delegate and datasource for table view
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        currentWeather = CurrentWeather()
        

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    
    //authorize location access and get location coordinates
    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            userLocation = locationManager.location
            Location.sharedInstance.latitude = userLocation.coordinate.latitude
            Location.sharedInstance.longitude = userLocation.coordinate.longitude
            
            //once locatoion is found, download weather data
            currentWeather.downloadWeatherData {
                self.downloadForecastData {
                    //load downloaded data in UI
                    self.updateMainUI()
                }
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    
    //Downloading forecast weather data for TableView
    func downloadForecastData(completed: @escaping DownloadComplete) {
        let forecastWeatherURL = URL(string: FORECAST_WEATHER_URL)!
        
        Alamofire.request(forecastWeatherURL).responseJSON { response in
            let result = response.result
            
            if let dict = result.value as? Dictionary<String, AnyObject> {
                
                if let list = dict["list"] as? [Dictionary<String, AnyObject>] {
                    
                    for obj in list {
                        let forecast = ForecastWeather(weatherDictionary: obj)
                        self.forecastData.append(forecast)
                    }
                    self.forecastData.remove(at: 0)
                    self.forecastTableView.reloadData()
                }
            }
            completed()
        }
    }

    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let forecastCell = forecastTableView.dequeueReusableCell(withIdentifier: "forecastTableCell", for: indexPath) as? WeatherCell {
            
            let forecast = forecastData[indexPath.row]
            forecastCell.configureCell(forecastWeather: forecast)
            return forecastCell
            
        } else {
            return WeatherCell()
        }
    }
    
    func updateMainUI() {
        currentLocation.text = currentWeather.cityName
        currentWeatherCondition.text = currentWeather.weatherType
        currentTemp.text = "\(currentWeather.currentTemp)°"
        todaysMinTemp.text = "\(currentWeather.minTemp)°"
        todaysMaxTemp.text = "\(currentWeather.maxTemp)°"
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }

}
