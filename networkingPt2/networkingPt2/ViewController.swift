//
//  ViewController.swift
//  networkingPt2
//
//  Created by Tess Shapiro on 11/16/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    
    
    @IBOutlet weak var articleTable: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
   
        let url = "https://www.reddit.com/.json"
        let session = NSURLSession.sharedSession()
        
        if let _url = NSURL(string: url) {
            let task = session.dataTaskWithURL(_url, completionHandler: self.onComplete)
            task.resume()
        }
    
    }
    var titles : [String] = []
    func onComplete(data: NSData?, response:NSURLResponse?, error:NSError?) {
        let json = JSON(data:data!)
        let articleArray = json["data"]["children"].array!
        for article in articleArray {
           let title = article["data"]["title"].string!
           titles.append(title)

        }

        dispatch_async(dispatch_get_main_queue()) {
            self.articleTable.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    table cell protocols
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let cell = tableView.dequeueReusableCellWithIdentifier("article_cell", forIndexPath: indexPath)
    }
}

