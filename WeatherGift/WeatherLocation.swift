//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Katrina Liu on 3/12/19.
//  Copyright © 2019 Katrina Liu. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var currentSummary = ""
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlAPIKey + coordinates
        
        AF.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    let roundedTemp = String(format:"%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("could not return temp")
                }
                
                
                if let summary = json["daily"]["summary"].string {
                    self.currentSummary = summary
                } else {
                    print("could not return a summary.")
                }
                
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("could not return an icon")
                }
                
            case .failure(let error):
                print(error)
            }
            completed()
        }
        
    }
}

