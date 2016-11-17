//
//  ClassesTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClassesTableViewController: UITableViewController {

	var classes = [ClassObject]()
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //saveClasses()
        
		tableView.register(ClassesTableViewCell.self, forCellReuseIdentifier: "classes")
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        classes.removeAll()
        if let savedClasses = loadClasses() {
            classes += savedClasses
        } else {
            loadSampleClasses()
        }
        
        if classes.count == 0 {
            loadSampleClasses()
            saveClasses()
        }
    }
    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        if let classViewController = sender.source as? NewClassViewController {
            
            if let classs = classViewController.classs {
                classes.append(classs)
                let indexPath = IndexPath(row: classes.count - 1, section: 0)
                tableView.insertRows(at: [indexPath], with: .automatic)
                saveClasses()
            }
        }
    }
	
	func loadSampleClasses() {
        let class0 = ClassObject(subject: "Class", room: "Room #", period: 8)!
        let class1 = ClassObject(subject: "Science", room: "300", period: 1)!
        let class2 = ClassObject(subject: "English", room: "200", period: 2)!
        let class3 = ClassObject(subject: "Math", room: "300", period: 3)!
        let class4 = ClassObject(subject: "Social Studies", room: "200", period: 4)!
        let class5 = ClassObject(subject: "Physical Education", room: "GYM", period: 5)!
        let class6 = ClassObject(subject: "Art", room: "100", period: 6)!
        let class7 = ClassObject(subject: "Music", room: "100", period: 7)!
		
		classes += [class0, class1, class2, class3, class4, class5, class6, class7]
	}

    // MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classes.count
    }
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "classes", for: indexPath as IndexPath) as! ClassesTableViewCell
		
		let item = classes[indexPath.row]
		
		cell.classes = item
		cell.selectionStyle = UITableViewCellSelectionStyle.none
		
		return cell
		
	}
	
	override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
		if indexPath.row > 0 {
			return UITableViewCellEditingStyle.delete
		} else {
			return UITableViewCellEditingStyle.none
		}
	}
		
	override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		
		if indexPath.row > 0 {
			if (editingStyle == UITableViewCellEditingStyle.delete) {
				// handle delete (by removing the data from your array and updating the tableview)
				classes.remove(at: indexPath.row)
				saveClasses()
				tableView.deleteRows(at: [indexPath], with: .automatic)
			}
		}
	}
	
	func saveClasses() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(classes, toFile: ClassObject.ArchiveURL.path)
		if !isSaveSuccessful {
			print("failed to save meals...")
		}
	}
	
	func loadClasses() -> [ClassObject]? {
		return NSKeyedUnarchiver.unarchiveObject(withFile: ClassObject.ArchiveURL.path) as? [ClassObject]
	}

}
