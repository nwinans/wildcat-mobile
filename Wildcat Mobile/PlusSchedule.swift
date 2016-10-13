//
//  PlusSchedule.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 10/9/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//
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
        


        
    }
    
    
}
