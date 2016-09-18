//
//  CrisisTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class CrisisTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		switch(indexPath.row) {
		case 0:
			callNumber("tel://7035274077")
		case 1:
			callNumber("tel://7035362000")
		case 2:
			callNumber("tel://7032897560")
		case 3:
			callNumber("tel://18446274747")
		case 4:
			callNumber("tel://1800273TALK")
		case 5:
			callNumber("tel://7035735769")
		case 6:
			callNumber("tel://7036912131")
		case 7:
			callNumber("tel://7033608404")
		case 8:
			callNumber("tel://911")
		default:
			break
		}
	}
	
	func callNumber(number: String) {
		var alert = UIAlertController.init(title: "This number is for crisis only", message: "Are you sure you want to call this number?", preferredStyle: UIAlertControllerStyle.ActionSheet)
		
		let callAction = UIAlertAction.init(title: "Call", style: UIAlertActionStyle.Default, handler: { (UIAlertAction) in
			UIApplication.sharedApplication().openURL(NSURL(string: number)!)
		})
		
		let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: { (UIAlertAction) in
			self.dismissViewControllerAnimated(true, completion: nil)
		})
		
		alert.addAction(callAction)
		alert.addAction(cancelAction)
		self.presentViewController(alert, animated: true, completion: nil)
	}

}
