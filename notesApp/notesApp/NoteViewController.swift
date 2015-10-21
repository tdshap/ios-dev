//
//  NoteViewController.swift
//  notesApp
//
//  Created by Tess Shapiro on 10/19/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {
    
    var note: Note!
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var contentField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.titleField.text = self.note.title
        self.contentField.text = self.note.content
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.note.title = self.titleField.text!
        self.note.content = self.contentField.text!
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
