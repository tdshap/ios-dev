//
//  WeatherModel.swift
//  weatherApp
//
//  Created by Tess Shapiro on 10/7/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import Foundation

enum Conditions{
    case Sunny
    case Snowy
    case Rainy
    case Cloudy
}

class WeatherData {
    
    var location0: Location
    var location1: Location
    var location2: Location
    
    init() {
        self.location0 = Location(city: "New York")
        self.location1 = Location(city: "Montreal")
        self.location2 = Location(city: "San Francisco")
    }
    
    private static var singleton: WeatherData?
    static func sharedInstance() -> WeatherData {
        
        if let _singleton = self.singleton{
            return _singleton
        }
        
        self.singleton = WeatherData()
        return self.singleton!
        
    }
    
    func updateWeather() {
// set values  -> normally use network
        self.location0.highTemp = 65
        self.location0.lowTemp = 45
        self.location0.currentTemp = 55
        self.location0.currentContitions = .Sunny
            
        self.location1.highTemp = 45
        self.location1.lowTemp = 35
        self.location1.currentTemp = 40
        self.location1.currentContitions = .Cloudy
            
        self.location2.highTemp = 75
        self.location2.lowTemp = 65
        self.location2.currentTemp = 68
        self.location2.currentContitions = .Rainy
    }
    
}


class Location {
    var name: String
    var highTemp: Double?
    var lowTemp: Double?
    var currentTemp: Double?
    var currentContitions: Conditions?
    
    init(city: String) {
       self.name = city
    }
}