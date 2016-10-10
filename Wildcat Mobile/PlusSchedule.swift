//
//  PlusSchedule.swift
//  Wildcat Mobile
//
//  Created by Nick Winans on 10/9/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import Foundation

class PlusSchedule {
    
    var desiredDate:NSDate
    var desiredPlus:String = "A+1"
    var plusCalendar:[String:String] = [String:String]()
    
    init(date:NSDate) {
        self.desiredDate = date
        setupPlus()
    }
    
    init() {
        self.desiredDate = NSDate()
        setupPlus()
    }
    
    func setDate(date:NSDate) {
        self.desiredDate = date
    }
    
    func getPlus() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return plusCalendar[dateFormatter.stringFromDate(desiredDate)]!
    }
    
    func plus() -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        return plusCalendar[dateFormatter.stringFromDate(NSDate())]!
    }
    
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
