//
//  AnnouncementTableViewCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/16/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class AnnouncementTableViewCell: UITableViewCell {

	@IBOutlet weak var announcementLabel: UILabel!
	@IBOutlet weak var nameLabel: UILabel!
	@IBOutlet weak var activityLabel: UILabel!
	@IBOutlet weak var dateLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.announcementLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        self.dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        
        let activityDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline)
        
        let boldTitleDescriptor = activityDescriptor.fontDescriptorWithSymbolicTraits(.TraitBold)
        
        self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(AnnouncementTableViewCell.didChangePreferredContentSize), name: UIContentSizeCategoryDidChangeNotification, object: nil)
		
        
    }
    
    func didChangePreferredContentSize() {
        self.announcementLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleBody)
        self.nameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
        let activityDescriptor = UIFontDescriptor.preferredFontDescriptorWithTextStyle(UIFontTextStyleHeadline)
        
        let boldTitleDescriptor = activityDescriptor.fontDescriptorWithSymbolicTraits(.TraitBold)
        
        self.activityLabel.font = UIFont(descriptor: boldTitleDescriptor!, size: 0)
        self.dateLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleFootnote)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
