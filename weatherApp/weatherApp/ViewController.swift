//
//  ViewController.swift
//  weatherApp
//
//  Created by Tess Shapiro on 10/7/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        WeatherData.sharedInstance().updateWeather()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let _ = sender as! UIButton
        
// you never want your app logic to be tied to whats in the views. give it ids/properties
//        print(button.titleLabel?.text)
        
        let locationController = segue.destinationViewController as! LocationViewController
        
        if segue.identifier == "location0" {
            locationController.location = WeatherData.sharedInstance().location0
        
        } else if segue.identifier == "location1" {
            locationController.location = WeatherData.sharedInstance().location1
        
        } else {
            locationController.location = WeatherData.sharedInstance().location2
        
        }
        
    }
}