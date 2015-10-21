//
//  notesDataModel.swift
//  notesApp
//
//  Created by Tess Shapiro on 10/19/15.
//  Copyright © 2015 Tess Shapiro. All rights reserved.
//

import Foundation

class NoteManager {
    var notes: [Note] = []
    
    func getNote(index:Int) -> Note {
        return self.notes[index]
    }
    
    func createNote(title:String) -> Note {
        let newNote = Note(title: title)
        self.notes.append(newNote)
        return newNote
    }
    
    func numberOfNotes() -> Int {
        return self.notes.count
    }
    static let singleton = NoteManager()
//    static var singleton: NoteManager?
//    static func sharedInstance() -> NoteManager {
//        if let _singleton = self.singleton {
//            return _singleton
//        }
//        self.singleton = NoteManager()
//        return self.singleton!
//    }


}


class Note {
    var title : String
    var content : String = ""
    
    init(title:String) {
        self.title = title
    }
    
    
    func getExcerpt() -> String{
        let index = self.content.startIndex
        
//        min is a function that gives you the min between 2 possibilities. Always Int
        let length = min(self.content.characters.count, 30)
        
        let endIndex = index.advancedBy(length)
        return self.content.substringToIndex(endIndex)
        
    }
}