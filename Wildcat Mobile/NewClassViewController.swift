//
//  NewClassViewController.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 11/16/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class NewClassViewController: UITableViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var room: UITextField!
    @IBOutlet weak var period: UITextField!
    
    var classs: ClassObject?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func saveNewClass() {
        guard let className = name.text, let roomNumber = room.text, let classPeriod = Int(period.text!)
            else {return}
        
        let newClass = ClassObject (subject: className, room: roomNumber, period: classPeriod)
        
        classs = newClass
        
        /*print(newClass!.period)
        
        var classes = NSKeyedUnarchiver.unarchiveObject(withFile: ClassObject.ArchiveURL.path) as? [ClassObject]
        
        classes! += [newClass!]
        
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(classes!, toFile: ClassObject.ArchiveURL.path)
        if !isSaveSuccessful {
            print("failed to save classes...")
        }*/
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            name.becomeFirstResponder()
        } else if indexPath.row == 1 {
            room.becomeFirstResponder()
        } else if indexPath.row == 2 {
            period.becomeFirstResponder()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "saveClass" {
            saveNewClass()
        }
    }
    
    
/*
    func saveClasses() {
        let
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(classes, toFile: ClassObject.ArchiveURL.path)
        if !isSaveSuccessful {
            print("failed to save meals...")
        }
    }
    
    func loadClasses() -> [ClassObject]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: ClassObject.ArchiveURL.path) as? [ClassObject]
    }
    
    func addNewItem() {
        if newsubject.isEmpty {
            return
        } else if newroom.isEmpty {
            classes += [ClassObject(subject: newsubject, room: " ")!]
        } else {
            classes += [ClassObject(subject: newsubject, room: newroom)!]
        }
        saveClasses()
        tableView.reloadData()
    }*/

}
