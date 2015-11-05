//
//  conversionModel.swift
//  conversionApp
//
//  Created by Tess Shapiro on 10/21/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import Foundation

class Conversion {
    var inputUnits = ""
    var outputUnits = ""
    
    func convert (input:Double) -> Double {
        return 0.1
    }
    func userFriendlyMessage() -> String {
        return "\(self.inputUnits) to \(self.outputUnits)"
    }
}


class FtoC : Conversion {
    override init() {
        super.init()
        self.inputUnits = "ºF"
        self.outputUnits = "ºC"
    }
    
    override func convert(input:Double) -> Double {
        let F = input
        let C = (F - 32) * 5.0 / 9.0
        return C
    }
}

class FtToMe : Conversion {
    override init() {
        super.init()
        self.inputUnits = "ft"
        self.outputUnits = "m"
    }
    
    override func convert(input:Double) -> Double {
        let ft = input
        let m = ft / 3.2808
        return m
    }
}