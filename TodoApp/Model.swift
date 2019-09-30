//
//  Model.swift
//  TodoApp
//
//  Created by Виктор on 27/09/2019.
//  Copyright © 2019 Виктор. All rights reserved.
//

import Foundation

var notesArray: [[String: Any]] {
    set {
        UserDefaults.standard.set(newValue, forKey: "Data")
        UserDefaults.standard.synchronize()
    }
    
    get {
        if let array = UserDefaults.standard.array(forKey: "Data")  as? [[String: Any]] {
            return array
        } else {
            return []
        }
    }
}




func changeState(item: Int) -> Bool {
    notesArray[item]["isDone"] = !(notesArray[item]["isDone"] as! Bool)
    
    return notesArray[item]["isDone"] as! Bool
}


func addNote(newNote: String) {
    notesArray.append(["Name": newNote, "isDone": false])
}

func deleteNote(index: Int) {
    notesArray.remove(at: index)
}

