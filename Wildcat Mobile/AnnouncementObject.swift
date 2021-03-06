//
// AnnouncementObject.swift
// Wildcat Mobile
// 
// Created by Nicholas Winans on 11/2/16.
// Copyright © 2016 Centreville HS. All rights reserved.

import UIKit

class AnnouncementObject: NSObject, NSCoding {
	//variables holding the strings relevant to announcements
	var activity: String
        var announcement: String
        var date: String
        var name: String
        
	//static variable that holds link to the Document Directory for this app
        static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
		
	//static variable to hold the url that this class saves it's data to
	static let ArchiveURL = DocumentsDirectory.appendingPathComponent("announcements")

	//struct to hold variables used to save and load the specific strings
	struct announcements {
		static let activity = "activity"
		static let announcement = "announcement"
		static let date = "date"
		static let name = "name"
	}
		
	//encode the strings with it's designated key in the above struct (necessary to save the object on the disk for later) 
	func encode(with aCoder: NSCoder) {
		aCoder.encode(activity, forKey: announcements.activity)
		aCoder.encode(announcement, forKey: announcements.announcement)
		aCoder.encode(date, forKey: announcements.date)
		aCoder.encode(name, forKey: announcements.name)
	}
		
	//secondary initializer used when loading data from previously encoded (saved) data
	required convenience init?(coder aDecoder: NSCoder) {
		let activity = aDecoder.decodeObject(forKey: announcements.activity) as! String
		let announcement = aDecoder.decodeObject(forKey: announcements.announcement) as! String
		let date = aDecoder.decodeObject(forKey: announcements.date) as! String
		let name = aDecoder.decodeObject(forKey: announcements.name) as! String
		
		//initialize using the below initializer
		self.init(activity: activity, announcement: announcement, date: date, name: name)
	}
		
	//main initializer used to set variables and determine if a component is missing
	init?(activity: String, announcement: String, date: String, name: String) {
		self.activity = activity
		self.announcement = announcement
		self.date = date
		self.name = name
			
		super.init()
			
		if activity.isEmpty || announcement.isEmpty || date.isEmpty || name.isEmpty {
			return nil
		}
	}
		
	//initializer used if data doesn't load for some reason (just a formality (hopefully))
	override init(){
		self.activity = "Error"
		self.announcement = "There was an error downloading this announcement, please try again later."
		self.date = "1/1/17"
		self.name = "Error"
	}
    
	//function to compare this object to another object the same way strings are compared
	func equals(compareTo:AnnouncementObject) -> Bool {
        	return self.activity == (compareTo.activity) && self.announcement == (compareTo.announcement) && self.date == compareTo.date && self.name == self.name
    	}
}
