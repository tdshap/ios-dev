//: Playground - noun: a place where people can play

import UIKit

var outsideTemperature : Int?;
var clothes : String?


if let _outsideTemperature = outsideTemperature {
    //    we know the temp
    if _outsideTemperature < 0 {
        clothes = "down jacket";
    } else if ( _outsideTemperature <= 30) {
        clothes = "jumper";
    } else if ( _outsideTemperature <= 50) {
        clothes = "hat and gloves"
    }
}




println(clothes)
