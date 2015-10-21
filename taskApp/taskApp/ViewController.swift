//
//  ViewController.swift
//  taskApp
//
//  Created by Tess Shapiro on 10/18/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

//    IB vars
    @IBOutlet weak var firstTaskInput: UITextField!
    @IBOutlet weak var secondTaskInput: UITextField!
    @IBOutlet weak var thirdTaskInput: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
//    segue leaving view controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Matrix" {
            let _ = segue.destinationViewController as! MatrixViewController
        }
        else {
            let taskController = segue.destinationViewController as! TaskViewController
            
            let _ = TaskManager()
          
            if segue.identifier == "firstTaskSegue" {
                taskController.currentTask = TaskManager.sharedInstance().firstTask
                TaskManager.sharedInstance().firstTask.title = firstTaskInput.text!
            } else if segue.identifier == "secondTaskSegue" {
                taskController.currentTask = TaskManager.sharedInstance().secondTask
                TaskManager.sharedInstance().secondTask.title = secondTaskInput.text!
                
            } else if segue.identifier == "thirdTaskSegue" {
                taskController.currentTask = TaskManager.sharedInstance().thirdTask
                TaskManager.sharedInstance().thirdTask.title = thirdTaskInput.text!
            }
        }
    }
    
    @IBAction func markFirstTaskIsComplete(sender: UIButton) {
        markComplete(sender, task: TaskManager.sharedInstance().firstTask)
    }
    
    @IBAction func markSecondTaskIsComplete(sender: UIButton) {
        markComplete(sender, task: TaskManager.sharedInstance().secondTask)
    }
    
    @IBAction func markThirdTaskIsComplete(sender: UIButton) {
        markComplete(sender, task: TaskManager.sharedInstance().thirdTask)
    }
    
    func markComplete(button: UIButton, task: TaskModel) {
//        mark complete on task instance
        task.markComplete()
        
    
//        change button image
        let completeImage = UIImage(named:"complete.png")
        let incompleteImage = UIImage(named:"incomplete.png")
        
        if button.currentImage == completeImage {
            button.setImage(incompleteImage, forState: UIControlState.Normal)
            
        } else {
            button.setImage(completeImage, forState: UIControlState.Normal)
        }
    }
}

