//
// AnnouncementObject.swift
// Wildcat Mobile
// 
// Created by Nicholas Winans on 11/2/16.
// Copyright © 2016 Centreville HS. All rights reserved.

import UIKit

class AnnouncementObject: NSObject, NSCoding {
		var activity: String
        var announcement: String
        var date: String
        var name: String
        
        static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
		
		static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("announcements")
		
		struct announcements {
			static let activity = "activity"
			static let announcement = "announcement"
			static let date = "date"
			static let name = "name"
		}
		
		func encodeWithCoder(aCoder: NSCoder) {
			aCoder.encodeObject(activity, forKey: announcements.activity)
			aCoder.encodeObject(announcement, forKey: announcements.announcement)
			aCoder.encodeObject(date, forKey: announcements.date)
			aCoder.encodeObject(name, forKey: announcements.name)
		}
		
		required convenience init?(coder aDecoder: NSCoder) {
			let activity = aDecoder.decodeObjectForKey(announcements.activity) as! String
			let announcement = aDecoder.decodeObjectForKey(announcements.announcement) as! String
			let date = aDecoder.decodeObjectForKey(announcements.date) as! String
			let name = aDecoder.decodeObjectForKey(announcements.name) as! String
			
			self.init(activity: activity, announcement: announcement, date: date, name: name)
		}
		
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
		
		override init(){
			self.activity = "Error"
			self.announcement = "There was an error downloading this announcement, please try again later."
			self.date = "1/1/17"
			self.name = "Error"
		}
    
    func equals(compareTo:AnnouncementObject) -> Bool {
        return self.activity == (compareTo.activity) && self.announcement == (compareTo.announcement) && self.date == compareTo.date && self.name == self.name
    }
}
