//: Playground - noun: a place where people can play

import UIKit
import Foundation
import XCPlayground

XCPSetExecutionShouldContinueIndefinitely()

func onCompletion(data:NSData?, response:NSURLResponse?, error:NSError?) {
    let stringOfData = NSString(data: data!, encoding: NSUTF8StringEncoding)
    print(stringOfData)
}

if let url = NSURL(string: "http://reddit.com/.json") {
    let task = NSURLSession.sharedSession().dataTaskWithURL(url, completionHandler: onCompletion)
    task.resume()
}