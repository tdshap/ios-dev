//
//  TaskViewController.swift
//  taskApp
//
//  Created by Tess Shapiro on 10/18/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class TaskViewController: UIViewController {
//    Class vars
    var currentTask :TaskModel?

    
//    IB vars on sreen
    @IBOutlet weak var currentTaskLabel: UILabel!
    @IBOutlet weak var isImportantLabel: UISwitch!
    @IBOutlet weak var isUrgentLabel: UISwitch!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var isComplete: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let _currentTask = currentTask {
             self.currentTaskLabel.text = _currentTask.title
        }
        
        if let _isUrgent = currentTask?.isUrgent {
            self.isUrgentLabel.setOn(_isUrgent, animated: false)
        }
        
        if let _isImportant = currentTask?.isImportant {
            self.isImportantLabel.setOn(_isImportant, animated: false)
        }
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

//    ib action functions
    @IBAction func isImportantChanged(sender: UISwitch) {
        if isImportantLabel.on {
            if let _currentTask = currentTask {
                _currentTask.isImportant = true
            }
        } else {
            if let _currentTask = currentTask {
                _currentTask.isImportant = false
            }
        }
    }
    
    @IBAction func isUrgentChanged(sender: UISwitch) {
        if isUrgentLabel.on {
            if let _currentTask = currentTask {
                _currentTask.isUrgent = true
            }
        } else {
            if let _currentTask = currentTask {
                _currentTask.isUrgent = false
            }
        }
    }
    @IBAction func dueDateChanged(sender: UIDatePicker) {
        let dueDate = sender.date
        daysUntilDue(dueDate)
    }
    
    //    class functions
    func markTaskComplete(task: TaskModel) {
        task.isComplete = true
    }
    
    func daysUntilDue(dueDate: NSDate) {
        let today = NSDate()
    
        let calendar: NSCalendar = NSCalendar.currentCalendar()
        // Replace the hour (time) of both dates with 00:00
        let date1 = calendar.startOfDayForDate(today)
        let date2 = calendar.startOfDayForDate(dueDate)
        
        let flags = NSCalendarUnit.Day
        let components = calendar.components(flags, fromDate: date1, toDate: date2, options: [])
        
        dueDateLabel.text = "You have \(components.day) days left to do this!"
    }
}
