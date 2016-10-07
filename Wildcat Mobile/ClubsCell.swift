//
//  ClubsCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/25/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClubsCell: FoldingCell {
	
	//Get labels from storyboard
	@IBOutlet weak var basicClubTitle: UILabel!
	@IBOutlet weak var moreClubTitle: UILabel!
	@IBOutlet weak var moreClubSponsor: UILabel!
	@IBOutlet weak var moreClubDescription: UILabel!
	@IBOutlet weak var moreClubContact: UIButton!
	
	var contactEmail = String()
	
	override func awakeFromNib() {
		
		//create rounded corners for foregroundView (the basic one with just the club)
		//there are a lot of clubs, so we dont use a cardView to save a little bit of memory and make the app seem faster
		foregroundView.layer.cornerRadius = 13
		foregroundView.layer.masksToBounds = true
		
		moreClubContact.layer.cornerRadius = 13
		moreClubContact.layer.masksToBounds = true
		
		moreClubContact.addTarget(self, action: #selector(sendEmail), forControlEvents: .TouchUpInside)
		
		super.awakeFromNib()
	}
	
	func sendEmail() {
		UIApplication.sharedApplication().openURL(NSURL(string: "mailto://" + contactEmail)!)
	}
	
	override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
		
		//create duration of animations
		let durations = [0.26, 0.2, 0.2]
		
		//return the durations
		return durations[itemIndex]
	}
	
}

