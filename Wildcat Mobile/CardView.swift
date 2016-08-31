//
//  CardView.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
	
	@IBInspectable var cornerRadius: CGFloat = 2
	
	@IBInspectable var shadowColor: UIColor? = UIColor.grayColor()
	@IBInspectable var shadowOpacity: Float = 0.5
	
	override func layoutSubviews() {
		layer.cornerRadius = cornerRadius
		let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
		
		layer.masksToBounds = false
		
		layer.shadowColor = shadowColor?.CGColor
		layer.shadowOffset = CGSize(width: 0, height: 3)
		layer.shadowOpacity = shadowOpacity
		
		layer.shadowPath = shadowPath.CGPath
	}
	
}
