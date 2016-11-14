//
//  AnnouncementTableViewCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/16/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

//import the UIKit as we use UILabels and UITableViewCell in this class
import UIKit

class AnnouncementTableViewCell: UITableViewCell {

	//get the labels from the storyboard
	@IBOutlet weak var announcementLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var activityLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
    	override func awakeFromNib() {
        	super.awakeFromNib()
        	//set font of announcement label to body text and the name + date to footnote objects
        	self.announcementLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        	self.nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        	self.dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        
		//create a UIFontDescriptor that holds the aspects of the headline text style and store it a variable in activity descriptor
        	let activityDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline)
        
		//create a variable called boldTitle that makes the activityDescriptor bold
        	let boldTitleDescriptor = activityDescriptor.fontDescriptorWithSymbolicTraits(.TraitBold)
        
		//set the activityLabel font to boldTitleDescriptor and a size that is scaled 1.25x the default font size (so the title and body aren't the same size
        	self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        
		//create a observer that listens for font size changes in Settings > Accessibility (this makes the font instantly scale up when the user return to the app after changing font sizes
        	NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AnnouncementTableViewCell.didChangePreferredContentSize), name: UIContentSizeCategoryDidChangeNotification, object: nil)        
    	}
    
    	func didChangePreferredContentSize() {
	   
		//repeat of above that re-sets fonts to new sizes when the user changes their font size mid app session 
        	self.announcementLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        	self.nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        	let activityDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline)
        
       		let boldTitleDescriptor = activityDescriptor.fontDescriptorWithSymbolicTraits(.TraitBold)
        
        	self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        	self.dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
	}
}
