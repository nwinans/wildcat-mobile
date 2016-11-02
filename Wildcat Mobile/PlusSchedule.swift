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
        //MARK: OCTOBER
        plusCalendar["10-08-2016"] = "B+4"
        plusCalendar["10-09-2016"] = "B+4"
        plusCalendar["10-10-2016"] = "B+4"
        plusCalendar["10-11-2016"] = "B+4"
        plusCalendar["10-12-2016"] = "A+3"
        plusCalendar["10-13-2016"] = "B+6"
        plusCalendar["10-14-2016"] = "A+5"
        plusCalendar["10-15-2016"] = "B+7"
        plusCalendar["10-16-2016"] = "B+7"
        plusCalendar["10-17-2016"] = "B+7"
        plusCalendar["10-18-2016"] = "A+1"
        plusCalendar["10-19-2016"] = "B"
        plusCalendar["10-20-2016"] = "A+3"
        plusCalendar["10-21-2016"] = "B+2"
        plusCalendar["10-22-2016"] = "A+5"
        plusCalendar["10-23-2016"] = "A+5"
        plusCalendar["10-24-2016"] = "A+5"
        plusCalendar["10-25-2016"] = "B+4"
        plusCalendar["10-26-2016"] = "A+7"
        plusCalendar["10-27-2016"] = "B+6"
        plusCalendar["10-28-2016"] = "A+1"
        plusCalendar["10-29-2016"] = "B+2"
        plusCalendar["10-30-2016"] = "B+2"
        plusCalendar["10-31-2016"] = "B+2"
        
        //NOVEMBER
        plusCalendar["11-01-2016"] = "A+3"
        plusCalendar["11-02-2016"] = "B+4"
        plusCalendar["11-03-2016"] = "A+5"
        plusCalendar["11-04-2016"] = "B"
        plusCalendar["11-05-2016"] = "A+1"
        plusCalendar["11-06-2016"] = "A+1"
        plusCalendar["11-07-2016"] = "A+1"
        plusCalendar["11-08-2016"] = "A+1"
        plusCalendar["11-09-2016"] = "A+1"
        plusCalendar["11-10-2016"] = "B+6"
        plusCalendar["11-11-2016"] = "A+3"
        plusCalendar["11-12-2016"] = "B+7"
        plusCalendar["11-13-2016"] = "B+7"
        plusCalendar["11-14-2016"] = "B+7"
        plusCalendar["11-15-2016"] = "A+5"
        plusCalendar["11-16-2016"] = "B+2"
        plusCalendar["11-17-2016"] = "A+1"
        plusCalendar["11-18-2016"] = "B+4"
        plusCalendar["11-19-2016"] = "A+7"
        plusCalendar["11-20-2016"] = "A+7"
        plusCalendar["11-21-2016"] = "A+7"
        plusCalendar["11-22-2016"] = "B+2"
        plusCalendar["11-23-2016"] = "A"
        plusCalendar["11-24-2016"] = "B+2"
        plusCalendar["11-25-2016"] = "B+2"
        plusCalendar["11-26-2016"] = "B+2"
        plusCalendar["11-27-2016"] = "B+2"
        plusCalendar["11-28-2016"] = "B+2"
        plusCalendar["11-29-2016"] = "A+3"
        plusCalendar["11-30-2016"] = "B+4"

        //DECEMBER
        plusCalendar["12-01-2016"] = "A+5"
        plusCalendar["12-02-2016"] = "B+6"
        plusCalendar["12-03-2016"] = "A+1"
        plusCalendar["12-04-2016"] = "A+1"
        plusCalendar["12-05-2016"] = "A+1"
        plusCalendar["12-06-2016"] = "B+7"
        plusCalendar["12-07-2016"] = "A+3"
        plusCalendar["12-08-2016"] = "B+2"
        plusCalendar["12-09-2016"] = "A+5"
        plusCalendar["12-10-2016"] = "B+4"
        plusCalendar["12-11-2016"] = "B+4"
        plusCalendar["12-12-2016"] = "B+4"
        plusCalendar["12-13-2016"] = "A+7"
        plusCalendar["12-14-2016"] = "B+6"
        plusCalendar["12-15-2016"] = "A+1"
        plusCalendar["12-16-2016"] = "B+2"
        plusCalendar["12-17-2016"] = "A+1"
        plusCalendar["12-18-2016"] = "B+4"
        plusCalendar["12-19-2016"] = "A+7"
        plusCalendar["12-20-2016"] = "A+7"
        plusCalendar["12-21-2016"] = "A+7"
        plusCalendar["12-22-2016"] = "B+2"
        plusCalendar["12-23-2016"] = "A"
        plusCalendar["12-24-2016"] = "B+2"
        plusCalendar["12-25-2016"] = "B+2"
        plusCalendar["12-26-2016"] = "B+2"
        plusCalendar["12-27-2016"] = "B+2"
        plusCalendar["12-28-2016"] = "B+2"
        plusCalendar["12-29-2016"] = "A+3"
        plusCalendar["12-30-2016"] = "B+4"

        
    }
    
    
}
