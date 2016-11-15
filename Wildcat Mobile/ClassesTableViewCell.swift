//
//  ClassesTableViewCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell{

	let subject: UITextField!
	let room: UITextField!
	
	let marginForLabels: CGFloat = 15.0
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
    }
	
	override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
		subject = UITextField(frame: CGRect.null)
		room = UITextField(frame: CGRect.null)
		
		subject.textColor = UIColor.black
		room.textColor = UIColor.black
		
		subject.font = UIFont.systemFont(ofSize: 16.0)
		room.font = UIFont.systemFont(ofSize: 16.0)
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
				
		subject.contentVerticalAlignment = UIControlContentVerticalAlignment.center
		room.contentVerticalAlignment = UIControlContentVerticalAlignment.center
		
		subject.autocorrectionType = .no
		room.autocorrectionType = .no
		
		subject.autocapitalizationType = .words
		room.autocapitalizationType = .allCharacters
		
		room.textAlignment = .right
		
		subject.isUserInteractionEnabled = false
		room.isUserInteractionEnabled = false
		
		addSubview(subject)
		addSubview(room)
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		subject.frame = CGRect(x: marginForLabels, y: 0, width: bounds.size.width - 60 - marginForLabels, height: bounds.size.height)
		
		room.frame = CGRect(x: bounds.size.width - 60 - marginForLabels, y: 0, width: 60, height: bounds.size.height)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	var classes:ClassObject? {
		didSet {
			if subject != nil {
			subject.text = classes?.subject
			room.text = classes?.room
			}
		}
	}
}
