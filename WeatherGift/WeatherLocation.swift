//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Katrina Liu on 3/23/19.
//  Copyright © 2019 Katrina Liu. All rights reserved.
//

import Foundation

class WeatherLocation: Codable {
    var name: String
    var coordinates: String
    
    init(name: String, coordinates: String) {
        self.name = name
        self.coordinates = coordinates
    }
}
