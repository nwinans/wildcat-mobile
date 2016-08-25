//
//  ClubsCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/25/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit
import FoldingCell

class ClubsCell: FoldingCell {
	override func awakeFromNib() {
		
		containerView.layer.cornerRadius = 10
		
		foregroundView.layer.cornerRadius = 10
		foregroundView.layer.masksToBounds = true
		
		
		super.awakeFromNib()
	}
	
	override func animationDuration(itemIndex:NSInteger, type:AnimationType)-> NSTimeInterval {
		
		let durations = [0.26, 0.2, 0.2]
		return durations[itemIndex]
	}
	
}

