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
        	self.announcementLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        	self.nameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        	self.dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        
		//create a UIFontDescriptor that holds the aspects of the headline text style and store it a variable in activity descriptor
        	let activityDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.headline)
        
		//create a variable called boldTitle that makes the activityDescriptor bold
        	let boldTitleDescriptor = activityDescriptor.withSymbolicTraits(.traitBold)
        
		//set the activityLabel font to boldTitleDescriptor and a size that is scaled 1.25x the default font size (so the title and body aren't the same size
        	self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        
		//create a observer that listens for font size changes in Settings > Accessibility (this makes the font instantly scale up when the user return to the app after changing font sizes
        	NotificationCenter.default.addObserver(self, selector: #selector(AnnouncementTableViewCell.didChangePreferredContentSize), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)        
    	}
    
    	func didChangePreferredContentSize() {
	   
		//repeat of above that re-sets fonts to new sizes when the user changes their font size mid app session 
        	self.announcementLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        	self.nameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
        	let activityDescriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: UIFontTextStyle.headline)
        
       		let boldTitleDescriptor = activityDescriptor.withSymbolicTraits(.traitBold)
        
        	self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        	self.dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.footnote)
	}
}
