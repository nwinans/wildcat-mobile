//
//  AcademicsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/31/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import SafariServices

class AcademicsViewController: UITableViewController, UINavigationControllerDelegate, SFSafariViewControllerDelegate{
	
	//setup transition variable - will hold the animation/transition type when a tableview row is selected
	let transition = SwiftyExpandingTransition()
	//setup an empty CGRect - will be assigned in prepareForSegue
	var selectedCellFrame = CGRectZero
	
	//Setup variables to get library cell and calendar cell from the Storyboard View
	@IBOutlet weak var libraryCell: UITableViewCell!
	@IBOutlet weak var calendarCell: UITableViewCell!
	@IBOutlet weak var athleticsCell: UITableViewCell!
    
    @IBOutlet weak var plusButton: UIBarButtonItem!
	
	//Default function called when view has been loaded (view is shown to user)
	override func viewDidLoad() {
		super.viewDidLoad()
        
        plusButton.title = PlusSchedule().plus()
		
		//setup tap recognizers so the library cell and calendar cell do their desired actions when clicked on
		let libraryTap = UITapGestureRecognizer(target: self, action: #selector(AcademicsViewController.libraryWebsite))
		let calendarTap = UITapGestureRecognizer(target: self, action: #selector(AcademicsViewController.calendarLink))
		let athleticsTap = UITapGestureRecognizer(target: self, action: #selector(AcademicsViewController.athleticsWebsite))
		
		//setup tap recognizers to only need 1 tap
		libraryTap.numberOfTapsRequired = 1
		calendarTap.numberOfTapsRequired = 1
		athleticsTap.numberOfTapsRequired = 1
		
		//override any settings in the storyboard disabling user input on the library and calendar cells
		libraryCell.userInteractionEnabled = true
		calendarCell.userInteractionEnabled = true
		athleticsCell.userInteractionEnabled = true
		
		//add the tap recognizer to the corrosponding cell
		libraryCell.addGestureRecognizer(libraryTap)
		calendarCell.addGestureRecognizer(calendarTap)
		athleticsCell.addGestureRecognizer(athleticsTap)
	}
	
	//default function run right before segue is called (right before leaving this page)
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		//if the segue isn't the crisis or plus buttons in the tab bar...
		if segue.identifier != "crisisAcademics" && segue.identifier != "plusAcademics" {
			//...set the selectedCellFrame variable equal to the tableView's frame
			self.selectedCellFrame = tableView.convertRect(sender!.frame, toView: tableView.superview)
			self.navigationController?.delegate = self
		}
	}
	
	//function to set animation controller for an operation
	func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		//if the segue is a push operation...
		if operation == UINavigationControllerOperation.Push {
			//...set the variable transition (initialized at top) to push segue type that animates over 0.4 seconds 
			//and the cellFrame is the one assigned in prepareForSegue
			transition.operation = UINavigationControllerOperation.Push
			transition.duration = 0.40
			transition.selectedCellFrame = self.selectedCellFrame
			
			return transition
		//or if the segue is a pop operation...
		} else if operation == UINavigationControllerOperation.Pop {
			//...set the variable transition to a pop segue type that occurs over 0.3 seconds, slightly faster. 
			transition.operation = UINavigationControllerOperation.Pop
			transition.duration = 0.30
			
			return transition
		}
		
		//the transition is some other type
		return nil
	}
	
	//pass the library url to the openURL function
	func libraryWebsite() {
		openURL("http://libcat.fcps.edu/uhtbin/cgisirsi/x/0/0/57/49?user_id=410WEB")
	}
	
	//pass the athletics url to the openURL function
	func athleticsWebsite() {
		openURL("http://wearecville.com")
	}
	
	//open url function
	func openURL(url: String) {
		//if you are on iOS 9 or above, open the provided url in the new Safari View Controller
		if #available(iOS 9, *) {
			let svc = SFSafariViewController(URL: NSURL(string: url)!)
			self.presentViewController(svc, animated: true, completion: nil)
		} else {
			//if you are on iOS 8, open the URL in Safari normally (leaves the app)
			UIApplication.sharedApplication().openURL(NSURL(string: url)!)
		}
	}
	
	//function handled when dismissing the Safari view controller, only available on ios9 and above
	@available(iOS 9.0, *)
	func safariViewControllerDidFinish(controller: SFSafariViewController) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}
	
	//open the calendar app
	func calendarLink() {
		UIApplication.sharedApplication().openURL(NSURL(string:"calshow://")!)
	}
	
}
