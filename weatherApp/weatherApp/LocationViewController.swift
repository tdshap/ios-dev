//
//  LocationViewController.swift
//  weatherApp
//
//  Created by Tess Shapiro on 10/7/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
// UI properties
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var highTempLabel: UILabel!
    @IBOutlet weak var lowTempLabel: UILabel!
    @IBOutlet weak var conditionsIcon: UIImageView!
    
    
// implicitly unwrapped optional
    var location: Location!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
// sets location and opt?s to views
        self.locationLabel.text = self.location.name
        
        if let _currentTemp = self.location.currentTemp {
            self.currentTempLabel.text = "Current: \(_currentTemp)"
        }
        
        if let _highTemp = self.location.highTemp {
            print(self.location.highTemp)
            self.highTempLabel.text = "High: \(_highTemp)"
        }
        
        if let _lowTemp = self.location.lowTemp {
            self.lowTempLabel.text = "Low: \(_lowTemp)"
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
