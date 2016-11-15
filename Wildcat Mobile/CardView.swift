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
	
	//create variable for the corner radius of the cards - we usually use 13 throughout the app - can be edited in the storyboard for a by card basis
	@IBInspectable var cornerRadius: CGFloat = 13
	
	//create shadow color and opacity variables - can be edited in the storyboard for a by card basis
	@IBInspectable var shadowColor: UIColor? = UIColor.darkGray
	@IBInspectable var shadowOpacity: Float = 1.0
	
	override func layoutSubviews() {
		//set the cornerRadius of the view to the cornerRadius variable
		layer.cornerRadius = cornerRadius
		
		//create the shadow with a BezierPath
		let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
		
		//sublayers aren't clipped to this view's bounds
		layer.masksToBounds = false
		
		//set shadow properties
		layer.shadowColor = shadowColor?.cgColor
		layer.shadowOffset = CGSize(width: 3, height: 3)
		layer.shadowOpacity = shadowOpacity
		
		//set shadow path to path created above in shadowPath
		layer.shadowPath = shadowPath.cgPath
	}
	
}
