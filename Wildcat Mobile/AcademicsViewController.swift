//
//  AcademicsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/31/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class AcademicsViewController: UITableViewController, UINavigationControllerDelegate/*, SegueHandlerType*/{
	
	let transition = SwiftyExpandingTransition()
	var selectedCellFrame = CGRectZero
	//var segueOptions: [String] = ["ScheduleVC", "TeachersVC", "ClassesVC", "LibraryVC"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
	}
	
	/*override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 4
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		if let cell = tableView.dequeueReusableCellWithIdentifier("cell") {
			cell.textLabel?.text = "testing" + String(indexPath.row)
		
			self.selectedCellFrame = tableView.convertRect(cell.frame, toView: tableView.superview)
			
			return cell


		}
		
		return UITableViewCell()
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		self.selectedCellFrame = tableView.convertRect(tableView.cellForRowAtIndexPath(indexPath)!.frame, toView: tableView.superview)
		
		self.performSegueWithIdentifier(segueOptions[indexPath.row], sender: nil)
	}*/
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		self.selectedCellFrame = tableView.convertRect(sender!.frame, toView: tableView.superview)
		self.navigationController?.delegate = self
	}
	
	func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
		if operation == UINavigationControllerOperation.Push {
			transition.operation = UINavigationControllerOperation.Push
			transition.duration = 0.30
			transition.selectedCellFrame = self.selectedCellFrame
			
			return transition
		} else if operation == UINavigationControllerOperation.Pop {
			transition.operation = UINavigationControllerOperation.Pop
			transition.duration = 0.15
			
			return transition
			
		}
		return nil
	}
	
}
