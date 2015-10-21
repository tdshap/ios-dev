//
//  TaskModel.swift
//  taskApp
//
//  Created by Tess Shapiro on 10/18/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class TaskManager{
    var firstTask: TaskModel
    var secondTask: TaskModel
    var thirdTask: TaskModel
    
    init() {
        firstTask = TaskModel()
        secondTask = TaskModel()
        thirdTask = TaskModel()

    }
    
    private static var singleton:TaskManager?
    static func sharedInstance() -> TaskManager {
        
        if let _singleton = self.singleton{
            return _singleton
        }
        
        self.singleton = TaskManager()
        return self.singleton!
        
    }
}

class TaskModel: NSObject {
    var title: String?
    var notes: String?
    var isComplete: Bool?
    var isImportant: Bool?
    var isUrgent: Bool?
    var dueDate: NSDate?
    
    func markComplete() {
        
        
    }
    
    func daysUntilDue() {
        if let _ = dueDate {
            let daysLeft = NSDate()
            print(daysLeft)
        }
        
    }
}
