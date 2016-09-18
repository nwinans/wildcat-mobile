//
//  AcademicsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/31/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import SafariServices

class AcademicsViewController: UITableViewController, UINavigationControllerDelegate, SFSafariViewControllerDelegate/*SegueHandlerType*/{
	
	let transition = SwiftyExpandingTransition()
	var selectedCellFrame = CGRectZero
	
	@IBOutlet weak var libraryCell: UITableViewCell!
	@IBOutlet weak var calendarCell: UITableViewCell!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//var childViewController: TeachersTableViewController = TeachersTableViewController.nib
		
		let singleTap = UITapGestureRecognizer(target: self, action: #selector(AcademicsViewController.libraryWebsite))
		singleTap.numberOfTapsRequired = 1
		
		let calendarTap = UITapGestureRecognizer(target: self, action: #selector(AcademicsViewController.calendarLink))
		calendarTap.numberOfTapsRequired = 1
		
		libraryCell.userInteractionEnabled = true
		libraryCell.addGestureRecognizer(singleTap)
		
		calendarCell.userInteractionEnabled = true
		calendarCell.addGestureRecognizer(calendarTap)
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		if segue.identifier != "crisisAcademics" && segue.identifier != "plusAcademics" {
			self.selectedCellFrame = tableView.convertRect(sender!.frame, toView: tableView.superview)
			self.navigationController?.delegate = self
		}
	}
	
	func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		if operation == UINavigationControllerOperation.Push {
			transition.operation = UINavigationControllerOperation.Push
			transition.duration = 0.40
			transition.selectedCellFrame = self.selectedCellFrame
			
			return transition
		} else if operation == UINavigationControllerOperation.Pop {
			transition.operation = UINavigationControllerOperation.Pop
			transition.duration = 0.30
			
			return transition
			
		}
		return nil
	}
	
	func libraryWebsite() {
		openURL("http://libcat.fcps.edu/uhtbin/cgisirsi/?ps=niWwvVsnMv/305/113560215/60/1182/X")
	}
	
	func openURL(url: String) {
		if #available(iOS 9, *) {
			let svc = SFSafariViewController(URL: NSURL(string: url)!)
			self.presentViewController(svc, animated: true, completion: nil)
		} else {
			UIApplication.sharedApplication().openURL(NSURL(string: url)!)
		}
	}
	
	@available(iOS 9.0, *)
	func safariViewControllerDidFinish(controller: SFSafariViewController) {
		controller.dismissViewControllerAnimated(true, completion: nil)
	}
	
	func calendarLink() {
		UIApplication.sharedApplication().openURL(NSURL(string:"calshow://")!)
	}
	
}
