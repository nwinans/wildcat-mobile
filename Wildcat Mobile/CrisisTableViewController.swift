//
//  CrisisTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import MessageUI

class CrisisTableViewController: UITableViewController, MFMessageComposeViewControllerDelegate{

    //default function called when view has been loaded
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
	//optional function called when a row is selected
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
		//if the cell belongs to the "call" section
		if indexPath.section == 0 {
			
			//start a switch on the row of the cell selected
			switch(indexPath.row) {
			case 0:
				callNumber(number: "tel://7035274077")
			case 1:
				callNumber(number: "tel://7035362000")
			case 2:
				callNumber(number: "tel://7032897560")
			case 3:
				callNumber(number: "tel://18446274747")
			case 4:
				callNumber(number: "tel://1800273TALK")
			case 5:
				callNumber(number: "tel://7035735769")
			case 6:
				callNumber(number: "tel://7036912131")
			case 7:
				callNumber(number: "tel://7033608404")
			case 8:
				callNumber(number: "tel://911")
			default:
				break
			}
		//if the cell is in the "text" section
		} else if indexPath.section == 1 {
			switch(indexPath.row) {
			case 0:
				sendMessage(sender: self)
			default:
				break
			}
		}
	}
	
	//function called a "call" number is clicked on 
	func callNumber(number: String) {
		//create a UIAlertController that will be an action sheet
		let alert = UIAlertController.init(title: "This number is for crisis only", message: "Are you sure you want to call this number?", preferredStyle: UIAlertControllerStyle.actionSheet)
		
		//create action to call the number
		let callAction = UIAlertAction.init(title: "Call", style: UIAlertActionStyle.default, handler: { (UIAlertAction) in
			UIApplication.shared.openURL(NSURL(string: number)! as URL)
		})
		
		//create action to cancel the number
		let cancelAction = UIAlertAction.init(title: "Cancel", style: UIAlertActionStyle.cancel, handler: { (UIAlertAction) in
			self.dismiss(animated: true, completion: nil)
		})
		
		//add actions to alert controller
		alert.addAction(callAction)
		alert.addAction(cancelAction)
		
		//present the action sheet
		self.present(alert, animated: true, completion: nil)
	}
	
	//function called when a user clicks a "text" cell
	func sendMessage(sender: AnyObject) {
		//create message view controller
		let messageVC = MFMessageComposeViewController()
		
		//set the body of the text message to NEEDHELP, and the recipient to 85511 (we only have one text-able number currently, so we can hardcode this)
		messageVC.body = "NEEDHELP";
		messageVC.recipients = ["85511"]
		
		//set the delegate to the CrisisTableViewController
		messageVC.messageComposeDelegate = self;
		
		//show the view controller of the text message
		self.present(messageVC, animated: false, completion: nil)
	}
	
	//required function called when the user either sends or cancels a message view controller 
	func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
		self.dismiss(animated: true, completion: nil)
	}
}
