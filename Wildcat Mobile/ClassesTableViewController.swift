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
	
	var singleClass: ClassObject?
	
	var classArray:Array<String> = [
	"Class",
	"Honors Physics",
	"Spanish 4",
	"AP US History",
	"AP Macro/Micro Economics",
	"AP Lang/Comp 11",
	"AP Computer Science",
	"Precalculus Honors"]
	
	var roomArray:Array<String> = [
	"Room #",
	"300",
	"200",
	"LC01",
	"MOD18",
	"200",
	"300",
	"100"]
	
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem()
		
		tableView.register(ClassesTableViewCell.self, forCellReuseIdentifier: "classes")
		
		if let savedClasses = loadClasses() {
			classes += savedClasses
		} else {
			loadSampleClasses()
		}
    }
	
	func loadSampleClasses() {
		let class0 = ClassObject(subject: "Class", room: "Room #")!
		let class1 = ClassObject(subject: "Science", room: "300")!
		let class2 = ClassObject(subject: "English", room: "200")!
		let class3 = ClassObject(subject: "Math", room: "300")!
		let class4 = ClassObject(subject: "Social Studies", room: "200")!
		let class5 = ClassObject(subject: "Physical Education", room: "GYM")!
		let class6 = ClassObject(subject: "Art", room: "100")!
		let class7 = ClassObject(subject: "Music", room: "100")!
		
		classes += [class0, class1, class2, class3, class4, class5, class6, class7]
	}

    // MARK: - Table view data source

	override func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
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
				tableView.reloadData()
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
	
	var newsubject: String = ""
	var newroom: String = ""
	
	@IBOutlet var newSubjectField: UITextField!
	@IBOutlet var newRoomField: UITextField!
	
	func classEntered(alert: UIAlertAction!){
		// store the new word
		self.newsubject = self.newSubjectField.text!
		self.newroom = self.newRoomField.text!
		
		addNewItem()
	}
	func addSubjectTextField(textField: UITextField!){
		// add the text field and make the result global
		textField.placeholder = "Subject"
		self.newSubjectField = textField
	}
	
	func addRoomTextField(textField: UITextField!) {
		textField.placeholder = "Room"
		self.newRoomField = textField
	}
	
	@IBAction func addItem() {
		// display an alert
		let newClassPrompt = UIAlertController(title: "Enter new class", message: "", preferredStyle: UIAlertControllerStyle.alert)
		newClassPrompt.addTextField(configurationHandler: addSubjectTextField)
		newClassPrompt.addTextField(configurationHandler: addRoomTextField)
		newClassPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
		newClassPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: classEntered))
		present(newClassPrompt, animated: true, completion: nil)
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
	}

}
