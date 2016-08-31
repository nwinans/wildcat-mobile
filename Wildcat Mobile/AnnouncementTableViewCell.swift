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
		
		//self.announcementLabel.preferredMaxLayoutWidth = self.announcementLabel.frame.width
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
