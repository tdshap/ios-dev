//
//  MatrixViewController.swift
//  taskApp
//
//  Created by Tess Shapiro on 10/20/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class MatrixViewController: UIViewController {
//    IB vars
    @IBOutlet weak var doLabel: UILabel!
    @IBOutlet weak var decideLabel: UILabel!
    @IBOutlet weak var delegateLabel: UILabel!
    @IBOutlet weak var deleteLabel: UILabel!
    @IBOutlet weak var moreInfoNeeded: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        martix model vars
        let allTasks = TaskManager.sharedInstance()
        
        
//        sort task
        func assignLabel(data: (Bool?, Bool?)) -> UILabel{
            if data.0 == true && data.1 == true {
                return doLabel
            } else if data.0 == true && data.1 == false {
                return decideLabel
            } else if data.0 == false && data.1 == true {
                return delegateLabel
            } else if data.0 == false && data.1 == false {
                return deleteLabel
            } else {
                return deleteLabel
            }
        }
        
        if let _ = allTasks.firstTask.title {
            let firstTaskLogic = (allTasks.firstTask.isImportant, allTasks.firstTask.isUrgent)
            let firstTaskLabel = assignLabel(firstTaskLogic)
            firstTaskLabel.text = firstTaskLabel.text! + " -" + allTasks.firstTask.title! + " "
        }
        if let _ = allTasks.secondTask.title {
            let secondTaskLogic = (allTasks.secondTask.isImportant, allTasks.secondTask.isUrgent)
            let secondTaskLabel = assignLabel(secondTaskLogic)
            secondTaskLabel.text = secondTaskLabel.text! + " -" + allTasks.secondTask.title! + " "
        }
        
        if let _ = allTasks.thirdTask.title {
            let thirdTaskLogic = (allTasks.thirdTask.isImportant, allTasks.thirdTask.isUrgent)
            let thirdTaskLabel = assignLabel(thirdTaskLogic)
            thirdTaskLabel.text = thirdTaskLabel.text! + " -" + allTasks.thirdTask.title! + " "
        }
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
