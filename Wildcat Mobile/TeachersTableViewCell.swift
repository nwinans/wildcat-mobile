//
//  TeachersTableViewCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/16/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class TeachersTableViewCell: UITableViewCell {

	@IBOutlet weak var teacher: UILabel!
	@IBOutlet weak var email: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }*/

}
