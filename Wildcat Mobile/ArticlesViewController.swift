//
//  ArticlesViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/29/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import SafariServices

class ArticlesViewController: UITableViewController, SFSafariViewControllerDelegate{

	@IBOutlet weak var educatorToolkitView: UIView!
	@IBOutlet weak var generalStatisticsView: UIView!
	@IBOutlet weak var whatShouldISayView: UIView!
	@IBOutlet weak var bodyImageView: UIView!
	@IBOutlet weak var projectAwareView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let educatorTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.educatorToolkit))
		let generalStatsTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.generalStatistics))
		let whatShouldTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.whatShouldISay))
		let bodyImageTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.bodyImage))
		let projectAwareTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.projectAware))
		
		educatorTap.numberOfTapsRequired = 1
		generalStatsTap.numberOfTapsRequired = 1
		whatShouldTap.numberOfTapsRequired = 1
		bodyImageTap.numberOfTapsRequired = 1
		projectAwareTap.numberOfTapsRequired = 1
		
		educatorToolkitView.userInteractionEnabled = true
		generalStatisticsView.userInteractionEnabled = true
		whatShouldISayView.userInteractionEnabled = true
		bodyImageView.userInteractionEnabled = true
		projectAwareView.userInteractionEnabled = true
		
		educatorToolkitView.addGestureRecognizer(educatorTap)
		generalStatisticsView.addGestureRecognizer(generalStatsTap)
		whatShouldISayView.addGestureRecognizer(whatShouldTap)
		bodyImageView.addGestureRecognizer(bodyImageTap)
		projectAwareView.addGestureRecognizer(projectAwareTap)
		
	}
	
	func educatorToolkit() {
		openURL("http://www.nationaleatingdisorders.org/sites/default/files/Toolkits/EducatorToolkit.pdf")
	}
	
	func generalStatistics() {
		openURL("http://www.nationaleatingdisorders.org/general-statistics")
	}
	
	func whatShouldISay() {
		openURL("http://www.nationaleatingdisorders.org/what-should-i-say")
	}
	
	func bodyImage() {
		openURL("http://www.nationaleatingdisorders.org/what-body-image")
	}
	
	func projectAware() {
		openURL("http://www.SAMHSA.gov")
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
	
}
