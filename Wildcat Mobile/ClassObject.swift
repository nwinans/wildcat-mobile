//
//  ClassObject.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 9/17/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

//import UIKit - required to use NSCoding
import UIKit

class ClassObject: NSObject, NSCoding {

	//setup variables of this class, subject and room are both strings
	var subject: String
	var room: String
	
	//get default directory to save objects for this app
	static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
	
	//get directory used to save this specific class
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("classes")

	//struct we use for saving later
	struct classes {
		static let subject = "subject"
		static let room = "room"
	}
	
	//encode the subject and room variables with the corrosponding string from the struct above. used when saving items to device
	func encode(with aCoder: NSCoder) {
		aCoder.encode(subject, forKey: classes.subject)
		aCoder.encode(room, forKey: classes.room)
	}
	
	//init used when decoding saved items 
	required convenience init?(coder aDecoder: NSCoder) {
		let subject = aDecoder.decodeObject(forKey: classes.subject) as! String
		let room = aDecoder.decodeObject(forKey: classes.room) as! String
		
		//run the actual init function with decoded variables
		self.init(subject: subject, room: room)
	}
	
	//initalize the class and check to make sure room or subject isn't empty
	init?(subject: String, room: String) {
		self.subject = subject
		self.room = room
		
		super.init()
		
		if subject.isEmpty || room.isEmpty {
			return nil
		}
	}
	
	//init run when subjuct and/or room are not given. hopefully just a formality and is never actually run
	override init() {
		self.subject = "Subject"
		self.room = "Room #"
	}
}
