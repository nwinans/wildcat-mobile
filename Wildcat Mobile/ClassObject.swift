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
	
	static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("classes")

	struct classes {
		static let subject = "subject"
		static let room = "room"
	}
	
	func encode(with aCoder: NSCoder) {
		aCoder.encode(subject, forKey: classes.subject)
		aCoder.encode(room, forKey: classes.room)
	}
	
	required convenience init?(coder aDecoder: NSCoder) {
		let subject = aDecoder.decodeObject(forKey: classes.subject) as! String
		let room = aDecoder.decodeObject(forKey: classes.room) as! String
		
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
