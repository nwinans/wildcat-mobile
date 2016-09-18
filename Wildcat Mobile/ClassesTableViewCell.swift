//
//  ClassesTableViewCell.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClassesTableViewCell: UITableViewCell, UITextFieldDelegate{

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
		
		subject.textColor = UIColor.blackColor()
		room.textColor = UIColor.blackColor()
		
		subject.font = UIFont.systemFontOfSize(16.0)
		room.font = UIFont.systemFontOfSize(16.0)
		
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		subject.delegate = self
		room.delegate = self
		
		subject.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
		room.contentVerticalAlignment = UIControlContentVerticalAlignment.Center
		
		subject.autocorrectionType = .No
		room.autocorrectionType = .No
		
		subject.autocapitalizationType = .Words
		room.autocapitalizationType = .AllCharacters
		
		room.textAlignment = .Right
		
		subject.userInteractionEnabled = false
		room.userInteractionEnabled = false
		
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
	
	func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
		if subject.text! == "Class" && room.text! == "Room #" {
			return false
		} else {
			return true
		}
	}
	
	func textFieldShouldReturn(textField: UITextField) -> Bool {
		textField.resignFirstResponder()
		return false
	}
	
	func textFieldShouldEndEditing(textField: UITextField) -> Bool {
		if classes != nil {
			classes?.subject = subject.text!
			classes?.room = room.text!
			
			print(classes)
		}
		return true
	}
	
	func saveClasses() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(classes!, toFile: ClassSchedule.ArchiveURL!.path!)
		
		if !isSaveSuccessful {
			print("Failed to save class...")
		}
	}
}
