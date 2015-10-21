//
//  ViewController.swift
//  notesApp
//
//  Created by Tess Shapiro on 10/19/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet weak var notesList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NoteManager.singleton.numberOfNotes()
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("note_cell", forIndexPath: indexPath)
        let note = NoteManager.singleton.getNote(indexPath.row)
        cell.textLabel?.text = note.title
        cell.detailTextLabel?.text = note.getExcerpt() + ".."
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let noteVC = segue.destinationViewController as! NoteViewController
        
        if segue.identifier == "create_note" {
            let newNote = NoteManager.singleton.createNote("Untitled")
            noteVC.note = newNote
            
        } else if segue.identifier == "edit_note" {
            let cell = sender as! UITableViewCell
            let index = self.notesList.indexPathForCell(cell)!
            let note = NoteManager.singleton.getNote(index.row)
            noteVC.note = note
        }
    }
    override func viewWillAppear(animated: Bool) {
        self.notesList.reloadData()
    }
}

