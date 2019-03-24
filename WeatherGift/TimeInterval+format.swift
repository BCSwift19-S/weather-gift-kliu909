//
//  TimeInterval+format.swift
//  WeatherGift
//
//  Created by Katrina Liu on 3/20/19.
//  Copyright © 2019 Katrina Liu. All rights reserved.
//

import Foundation



extension TimeInterval {
    
    func format(timeZone: String, dateFormatter: DateFormatter) -> String {
        let usableDate = Date(timeIntervalSince1970: self)
        dateFormatter.timeZone = TimeZone(identifier: timeZone)
        let dateString = dateFormatter.string(from: usableDate)
        return dateString
    }
    
}
