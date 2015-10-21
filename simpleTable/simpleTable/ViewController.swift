//
//  ViewController.swift
//  simpleTable
//
//  Created by Tess Shapiro on 10/19/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    first connect table view to this view controller
    
    var items = ["first thing", "second thing", "last thing"]
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
//    must create and return a UITableViewCell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let item = self.items[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
}

