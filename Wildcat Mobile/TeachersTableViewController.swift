//
//  TeachersTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/6/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class TeachersTableViewController: UITableViewController {

	var teacherArray:Array<String> = Array<String>()
	//var emailArray:Array<String> = Array<String>()
	
	var emailDictionary: [String: String] = [String: String]()
	
	var previouslySelectedHeaderIndex: Int?
	var currentlySelectedHeaderIndex: Int?
	var currentlySelectedItemIndex: Int?
	
	let cells = SwiftyAccordionCells()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.setup()
		self.tableView.estimatedRowHeight = 45
		self.tableView.rowHeight = UITableViewAutomaticDimension
	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		self.tableView.reloadData()
	}
	
	func setup() {
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Mathematics"))
		self.cells.append(SwiftyAccordionCells.Item(value: "Beatty, Kathy"))
		self.cells.append(SwiftyAccordionCells.HeaderItem(value: "Science"))
		self.cells.append(SwiftyAccordionCells.Item(value: "Abrahams, Heather"))
		self.cells.append(SwiftyAccordionCells.Item(value: "Banbury, Demby B."))
		
		emailDictionary["Beatty, Kathy"] = "KABeatty@fcps.edu"
		emailDictionary["Abrahams, Heather"] = "haabrahams@fcps.edu"
		emailDictionary["Banbury, Demby B."] = "DBBanbury@fcps.edu"
	}
	
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.cells.items.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let item = self.cells.items[indexPath.row]
		let value = item.value as? String
		
		if item as? SwiftyAccordionCells.HeaderItem == nil {
			/*let cell = tableView.dequeueReusableCellWithIdentifier("teachers", forIndexPath: indexPath) as! TeachersTableViewCell
			
			cell.teacher.text = value
			cell.email.text = "hello"//emailDictionary[value!]*/
			
			let cell = UITableViewCell(/*style: UITableViewCellStyle.Subtitle, reuseIdentifier: "teacherz"*/)
			cell.textLabel?.numberOfLines = 2
			cell.textLabel?.text = value! + "\n" + emailDictionary[value!]!
			cell.textLabel?.clipsToBounds = true
			cell.selectionStyle = UITableViewCellSelectionStyle.None
			return cell
		} else {
			let cell = UITableViewCell()
			cell.textLabel?.text = value
			cell.backgroundColor = UIColor.blackColor()
			cell.textLabel?.textColor = UIColor.whiteColor()
			cell.textLabel?.clipsToBounds = true
			cell.selectionStyle = UITableViewCellSelectionStyle.None
			return cell
		}
		
		
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		let item = self.cells.items[indexPath.row]
		
		if item is SwiftyAccordionCells.HeaderItem {
			return 60
		} else if item.isHidden {
			return 0
		} else {
			return UITableViewAutomaticDimension
		}
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let item = self.cells.items[indexPath.row]
		
		if item is SwiftyAccordionCells.HeaderItem {
			if self.currentlySelectedHeaderIndex == nil {
				self.currentlySelectedHeaderIndex = indexPath.row
			} else {
				self.previouslySelectedHeaderIndex = self.currentlySelectedHeaderIndex
				self.currentlySelectedHeaderIndex = indexPath.row
			}
			
			if let previouslySelectedHeaderIndex = self.previouslySelectedHeaderIndex {
				self.cells.collapse(previouslySelectedHeaderIndex)
			}
			
			if self.previouslySelectedHeaderIndex != self.currentlySelectedHeaderIndex {
				self.cells.expand(self.currentlySelectedHeaderIndex!)
			} else {
				self.currentlySelectedHeaderIndex = nil
				self.previouslySelectedHeaderIndex = nil
			}
			
			self.tableView.beginUpdates()
			self.tableView.endUpdates()
			
		} else {
			self.currentlySelectedItemIndex = indexPath.row
			var alert = UIAlertController.init(title: "What would you like to do?", message: "Would you like to copy this teacher's email, or start a new email to this teacher?", preferredStyle: UIAlertControllerStyle.ActionSheet)
			
			let copyAction = UIAlertAction.init(title: "Copy", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
				UIPasteboard.generalPasteboard().string = self.emailDictionary[item.value as! String]!
			})
			
			let sendAction = UIAlertAction.init(title: "Send an Email", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
				UIApplication.sharedApplication().openURL(NSURL(string: "mailto:" + self.emailDictionary[item.value as! String]!)!)
			})
			
			let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (UIAlertAction) in
				self.dismissViewControllerAnimated(true, completion: nil)
			})
			
			alert.addAction(copyAction)
			alert.addAction(sendAction)
			alert.addAction(cancelAction)
			self.presentViewController(alert, animated: true, completion: nil)
		}
	}
	
	
}
