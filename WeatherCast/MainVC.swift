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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting delegate and datasource for table view
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
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

}
