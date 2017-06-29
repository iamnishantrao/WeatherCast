//
//  MainVC.swift
//  WeatherCast
//
//  Created by Nishant on 27/06/17.
//  Copyright © 2017 rao. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentTemp: UILabel!
    @IBOutlet weak var currentLocation: UILabel!
    @IBOutlet weak var currentWeatherCondition: UILabel!
    @IBOutlet weak var todaysMinTemp: UILabel!
    @IBOutlet weak var todaysMaxTemp: UILabel!
    @IBOutlet weak var forecastTableView: UITableView!
    
    var currentWeather: CurrentWeather!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting delegate and datasource for table view
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
        
        currentWeather = CurrentWeather()
        
        currentWeather.downloadWeatherData {
            //load downloaded data in UI
            self.updateMainUI()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let forecastCell = forecastTableView.dequeueReusableCell(withIdentifier: "forecastTableCell", for: indexPath)
        
        return forecastCell
    }
    
    func updateMainUI() {
        currentLocation.text = currentWeather.cityName
        currentWeatherCondition.text = currentWeather.weatherType
        currentTemp.text = "\(currentWeather.currentTemp)°"
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }

}
