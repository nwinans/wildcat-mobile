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

	//create variables for each of the UIViews in the storyboard (each of the individual cards)
	@IBOutlet weak var educatorToolkitView: UIView!
	@IBOutlet weak var generalStatisticsView: UIView!
	@IBOutlet weak var whatShouldISayView: UIView!
	@IBOutlet weak var bodyImageView: UIView!
	@IBOutlet weak var projectAwareView: UIView!
    @IBOutlet weak var stopBullyingView: UIView!
    @IBOutlet weak var crisisLinkView: UIView!
    @IBOutlet weak var mentalHealthView: UIView!
    //@IBOutlet weak var substanceAbuseView: UIView!
    
	//create variable for plus button - used to set the current plus at runtime 
    @IBOutlet weak var plusButton: UIBarButtonItem!
	
	override func viewDidLoad() {
		super.viewDidLoad()
        	
		//set the plus button text to the current plus obtained from the PlusSchedule class
       		plusButton.title = PlusSchedule().plus()
		
		//create listeners to listen for taps on each of the cards
		let educatorTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.educatorToolkit))
		let generalStatsTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.generalStatistics))
		let whatShouldTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.whatShouldISay))
		let bodyImageTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.bodyImage))
		let projectAwareTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.projectAware))
        let stopBullyingTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.stopBullying))
        let crisisLinkTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.crisisLink))
        let mentalHealthTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.mentalHealth))
        //let substanceAbuseTap = UITapGestureRecognizer(target: self, action: #selector(ArticlesViewController.substanceAbuse))
		
		//set the required number of taps to 1 (probably not needed but makes sure that only one tap needed)
		educatorTap.numberOfTapsRequired = 1
		generalStatsTap.numberOfTapsRequired = 1
		whatShouldTap.numberOfTapsRequired = 1
		bodyImageTap.numberOfTapsRequired = 1
		projectAwareTap.numberOfTapsRequired = 1
        stopBullyingTap.numberOfTapsRequired = 1
        crisisLinkTap.numberOfTapsRequired = 1
        mentalHealthTap.numberOfTapsRequired = 1
		//substanceAbuseTap.numberOfTapsRequired = 1
		
		//override any settings in the storyboard preventing user interaction
		educatorToolkitView.isUserInteractionEnabled = true
		generalStatisticsView.isUserInteractionEnabled = true
		whatShouldISayView.isUserInteractionEnabled = true
		bodyImageView.isUserInteractionEnabled = true
		projectAwareView.isUserInteractionEnabled = true
        stopBullyingView.isUserInteractionEnabled = true
        crisisLinkView.isUserInteractionEnabled = true
        mentalHealthView.isUserInteractionEnabled = true
        //substanceAbuseView.isUserInteractionEnabled = true
		
		//add tap listeners to the corrosponding views
		educatorToolkitView.addGestureRecognizer(educatorTap)
		generalStatisticsView.addGestureRecognizer(generalStatsTap)
		whatShouldISayView.addGestureRecognizer(whatShouldTap)
		bodyImageView.addGestureRecognizer(bodyImageTap)
		projectAwareView.addGestureRecognizer(projectAwareTap)
        stopBullyingView.addGestureRecognizer(stopBullyingTap)
        crisisLinkView.addGestureRecognizer(crisisLinkTap)
        mentalHealthView.addGestureRecognizer(mentalHealthTap)
        //substanceAbuseView.addGestureRecognizer(substanceAbuseTap)
	}
	
	//functions to open corrosponding links from the cards (called when tap listener is tapped)
	
	func educatorToolkit() {
		openURL(url: "http://www.nationaleatingdisorders.org/sites/default/files/Toolkits/EducatorToolkit.pdf")
	}
	
	func generalStatistics() {
		openURL(url: "http://www.nationaleatingdisorders.org/general-statistics")
	}
	
	func whatShouldISay() {
		openURL(url: "http://www.nationaleatingdisorders.org/what-should-i-say")
	}
	
	func bodyImage() {
		openURL(url: "http://www.nationaleatingdisorders.org/what-body-image")
	}
	
	func projectAware() {
		openURL(url: "http://www.SAMHSA.gov")
	}
    
    func stopBullying() {
        openURL(url: "http://www.stopbullying.gov")
    }
    
    func crisisLink() {
        openURL(url: "https://www.fcps.edu/resources/student-safety-and-wellness/mental-health-resources-and-emergency-services-information")
    }
    
    func mentalHealth() {
        openURL(url: "https://www.fcps.edu/resources/student-safety-and-wellness/mental-health-and-resiliency")
    }
    
    /*func substanceAbuse() {
        openURL(url: "http://www.fcps.edu")
    }*/
	
	//function to open a url in the new SafariViewController on iOS 9+ or regular old safari in ios 8
	func openURL(url: String) {
		if #available(iOS 9, *) {
			let svc = SFSafariViewController(url: NSURL(string: url)! as URL)
			self.present(svc, animated: true, completion: nil)
		} else {
			UIApplication.shared.openURL(NSURL(string: url)! as URL)
		}
	}
	
	//if user is on iOS 9+, and the user clicks done on the view controller, dismiss the view controller and do nothing else
	@available(iOS 9.0, *)
	func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
		controller.dismiss(animated: true, completion: nil)
	}
	
}
