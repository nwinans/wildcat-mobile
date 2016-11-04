//
//  PlusSchedule.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 10/9/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import Foundation

class PlusSchedule {
    
    //create variables that hold the desired date, plus, and a dictionary that will hold the plus for each date
    var desiredDate:NSDate
    var desiredPlus:String = "A+1"
    var plusCalendar:[String:String] = [String:String]()
    
    var plusses = [Plus]()
    
    var defaultSpreadsheetURL = ""
    
    //initialze this class if a date is passed
    init(date:NSDate) {
        //set desired date to the passed date
        self.desiredDate = date
        
        //run the setup function
        setupPlus()
    }
    
    //initialize this class when a date isn't passed
    init() {
        //set desired date to current date
        self.desiredDate = NSDate()
        
        //run the setup function
        setupPlus()
    }
    
    //function to update desired ate
    func setDate(date:NSDate) {
        //set desired date to given new date
        self.desiredDate = date
    }
    
    //function that returns a string containing the Plus
    func getPlus() -> String {
        //Initialize a dateFormatter
        let dateFormatter = NSDateFormatter()
        //set the format to the format of the plus schedule
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //return the item from the plusCalendar dictionary where the date is equal to the desired date
        return plusCalendar[dateFormatter.stringFromDate(desiredDate)]!
    }
    
    //copy of getPlus, but doesnt use the desired date, instead using the current date no matter what
    func plus() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return plusCalendar[dateFormatter.stringFromDate(NSDate())]!
    }
    
    //setup plus dictionary with every date and its corrosponding plus
    func setupPlus() {
        if let savedPlusses = loadPlusses() {
            plusses += savedPlusses
        }
        
        getDataFromURL(defaultSpreadsheetURL)
        
    }
    
    func savePlusses() {
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(plusses, toFile: AnnouncementObject.ArchiveURL!.path!)
        if !isSaveSuccessful {
            print("failed to save")
        }
    }
    
    func loadPlusses() -> [Plus]? {
        return NSKeyedUnarchiver.unarchiveObjectWithFile(Plus.ArchiveURL!.path!) as? [Plus]
    }
    
    
}
