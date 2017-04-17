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
        
        self.announcementLabel.numberOfLines = 0
        self.activityLabel.numberOfLines = 0
        
        //set font of announcement label to body text and the name & date to footnote objects
        self.announcementLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        self.nameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        self.dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        if #available(iOS 9.0, *) {
            self.activityLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        } else {
            self.activityLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(AnnouncementTableViewCell.didChangePreferredContentSize), name: NSNotification.Name.UIContentSizeCategoryDidChange, object: nil)
    }
    
    func didChangePreferredContentSize() {
        //repeat of above that re-sets fonts to new sizes when the user changes their font size mid app session
        self.announcementLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)
        self.nameLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        self.dateLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.subheadline)
        if #available(iOS 9.0, *) {
            self.activityLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1)
        } else {
            self.activityLabel.font = UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)
        }
        
	}
}
