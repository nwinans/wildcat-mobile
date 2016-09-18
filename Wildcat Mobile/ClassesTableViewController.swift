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
		
		tableView.registerClass(ClassesTableViewCell.self, forCellReuseIdentifier: "classes")
		
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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return classes.count
    }
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("classes", forIndexPath: indexPath) as! ClassesTableViewCell
		
		let item = classes[indexPath.row]
		
		cell.classes = item
		cell.selectionStyle = UITableViewCellSelectionStyle.None
		
		return cell
		
	}
	
	override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
		if indexPath.row > 0 {
			return UITableViewCellEditingStyle.Delete
		} else {
			return UITableViewCellEditingStyle.None
		}
	}
	
    // Override to support conditional editing of the table view.
	override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
		/*if indexPath.row > 0 {
			return true
		} else {
			return false
		}*/
		
		return true
	}
	
	
	override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
		
		if indexPath.row > 0 {
			if (editingStyle == UITableViewCellEditingStyle.Delete) {
				// handle delete (by removing the data from your array and updating the tableview)
				classes.removeAtIndex(indexPath.row)
				saveClasses()
				tableView.reloadData()
			}
		}
	}
	
	func saveClasses() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(classes, toFile: ClassObject.ArchiveURL!.path!)
		if !isSaveSuccessful {
			print("failed to save meals...")
		}
	}
	
	func loadClasses() -> [ClassObject]? {
		return NSKeyedUnarchiver.unarchiveObjectWithFile(ClassObject.ArchiveURL!.path!) as? [ClassObject]
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
		let newClassPrompt = UIAlertController(title: "Enter new class", message: "", preferredStyle: UIAlertControllerStyle.Alert)
		newClassPrompt.addTextFieldWithConfigurationHandler(addSubjectTextField)
		newClassPrompt.addTextFieldWithConfigurationHandler(addRoomTextField)
		newClassPrompt.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
		newClassPrompt.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: classEntered))
		presentViewController(newClassPrompt, animated: true, completion: nil)
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
