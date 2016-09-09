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
	var emailArray:Array<String> = Array<String>()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Teachers"
	}
	
	override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		return 1
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return teacherArray.count
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("teacherCell", forIndexPath: indexPath) /*as! TeachersTableViewCell
		
		cell.teah*/
		
		return cell
	}
}
