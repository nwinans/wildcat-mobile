//
//  ClassObject.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClassObject: NSObject, NSCoding {
	var subject: String
	var room: String
	
	static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
	
	static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("classes")

	
	struct classes {
		static let subject = "subject"
		static let room = "room"
	}
	
	func encodeWithCoder(aCoder: NSCoder) {
		aCoder.encodeObject(subject, forKey: classes.subject)
		aCoder.encodeObject(room, forKey: classes.room)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		let subject = aDecoder.decodeObjectForKey(classes.subject) as! String
		let room = aDecoder.decodeObjectForKey(classes.room) as! String
		
		self.init(subject: subject, room: room)
	}
	
	init?(subject: String, room: String) {
		self.subject = subject
		self.room = room
		
		super.init()
		
		if subject.isEmpty || room.isEmpty {
			return nil
		}
	}
	
	override init() {
		self.subject = "Subject"
		self.room = "Room #"
	}
}
