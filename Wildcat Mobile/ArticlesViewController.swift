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
    @IBOutlet weak var stopBullyingView: UIView!
    @IBOutlet weak var crisisLinkView: UIView!
    @IBOutlet weak var mentalHealthView: UIView!
    @IBOutlet weak var substanceAbuseView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let educatorTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.educatorToolkit))
		let generalStatsTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.generalStatistics))
		let whatShouldTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.whatShouldISay))
		let bodyImageTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.bodyImage))
		let projectAwareTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.projectAware))
        let stopBullyingTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.stopBullying))
        let crisisLinkTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.crisisLink))
        let mentalHealthTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.mentalHealth))
        let substanceAbuseTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.substanceAbuse))
		
		educatorTap.numberOfTapsRequired = 1
		generalStatsTap.numberOfTapsRequired = 1
		whatShouldTap.numberOfTapsRequired = 1
		bodyImageTap.numberOfTapsRequired = 1
		projectAwareTap.numberOfTapsRequired = 1
        stopBullyingTap.numberOfTapsRequired = 1
        crisisLinkTap.numberOfTapsRequired = 1
        mentalHealthTap.numberOfTapsRequired = 1
        substanceAbuseTap.numberOfTapsRequired = 1
		
		educatorToolkitView.userInteractionEnabled = true
		generalStatisticsView.userInteractionEnabled = true
		whatShouldISayView.userInteractionEnabled = true
		bodyImageView.userInteractionEnabled = true
		projectAwareView.userInteractionEnabled = true
        stopBullyingView.userInteractionEnabled = true
        crisisLinkView.userInteractionEnabled = true
        mentalHealthView.userInteractionEnabled = true
        substanceAbuseView.userInteractionEnabled = true
		
		educatorToolkitView.addGestureRecognizer(educatorTap)
		generalStatisticsView.addGestureRecognizer(generalStatsTap)
		whatShouldISayView.addGestureRecognizer(whatShouldTap)
		bodyImageView.addGestureRecognizer(bodyImageTap)
		projectAwareView.addGestureRecognizer(projectAwareTap)
        stopBullyingView.addGestureRecognizer(stopBullyingTap)
        crisisLinkView.addGestureRecognizer(crisisLinkTap)
        mentalHealthView.addGestureRecognizer(mentalHealthTap)
        substanceAbuseView.addGestureRecognizer(substanceAbuseTap)
		
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
    
    func stopBullying() {
        openURL("http://www.stopbullying.gov")
    }
    
    func crisisLink() {
        openURL("https://www.fcps.edu/resources/student-safety-and-wellness/mental-health-resources-and-emergency-services-information")
    }
    
    func mentalHealth() {
        openURL("https://www.fcps.edu/resources/student-safety-and-wellness/mental-health-and-resiliency")
    }
    
    func substanceAbuse() {
        openURL("http://www.fcps.edu")
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
