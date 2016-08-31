//
//  ArticlesViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/29/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import SafariServices

class ArticlesViewController: UIViewController, SFSafariViewControllerDelegate{

	@IBOutlet weak var educatorToolkitImageView: UIImageView!
	@IBOutlet weak var generalStatisticsButton: UIButton!
	@IBOutlet weak var whatShouldISayButton: UIButton!
	@IBOutlet weak var bodyImageButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let singleTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.educatorToolkit))
		singleTap.numberOfTapsRequired = 1
		
		educatorToolkitImageView.userInteractionEnabled = true
		educatorToolkitImageView.addGestureRecognizer(singleTap)
		
		generalStatisticsButton.addTarget(self, action: #selector(ArticlesViewController.generalStatistics), forControlEvents: .TouchUpInside)
		
		whatShouldISayButton.addTarget(self, action: #selector(ArticlesViewController.whatShouldISay), forControlEvents: .TouchUpInside)
		
		bodyImageButton.addTarget(self, action: #selector(ArticlesViewController.bodyImage), forControlEvents: .TouchUpInside)
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
