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
    var tempPlusses = [Plus]()
    
    var defaultSpreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1z6JyOZYNLoMKuoQACGzv5xN9gQqnQpUyDP4nD0PCQec&sheet=Sheet1"
    
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
        let dateFormatter = DateFormatter()
        //set the format to the format of the plus schedule
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //return the item from the plusCalendar dictionary where the date is equal to the desired date
        return plusCalendar[dateFormatter.string(from: desiredDate as Date)]!
    }
    
    //copy of getPlus, but doesnt use the desired date, instead using the current date no matter what
    func plus() -> String {
        setupPlus()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        //return plusses[//plusCalendar[dateFormatter.stringFromDate(NSDate())]!
        
        let currentdate = dateFormatter.string(from: NSDate() as Date)
        
        for i in stride(from: 0, to: plusses.count, by: 1) {
            print(plusses[i].date)
            
            if plusses[i].date == (currentdate){
                return plusses[i].fullPlus
            }
        }
        return "ERROR"
    }
    
    //setup plus dictionary with every date and its corrosponding plus
    func setupPlus() {
        if let savedPlusses = loadPlusses() {
            plusses += savedPlusses
        }
        
        getDataFromURL(url: defaultSpreadsheetURL)
        
    }
    
    func savePlusses() {
        let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(plusses, toFile: Plus.ArchiveURL.path)
        if !isSaveSuccessful {
            print("failed to save")
        }
    }
    
    func loadPlusses() -> [Plus]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Plus.ArchiveURL.path) as? [Plus]
    }
    
    func getDataFromURL(url: String) {
		
		let timeout = 15.0
		let url = NSURL(string: url)
		
		//setup url request with url, default cache policy, and timeout length
		let urlRequest = NSMutableURLRequest(url: url! as URL, cachePolicy: NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeout)
		
		let queue = OperationQueue()
		
		//actually get the information asynchronously
		NSURLConnection.sendAsynchronousRequest(urlRequest as URLRequest, queue: queue) { (response: URLResponse?, data: Data?, error: Error?) in
			
            if data == nil {
                return
            }
            
			//if the data has length and there was no error, extract the JSON tree from the data
			//else if the data length is 0 and there was no error, print a message to the console that there was nothing to download at the url
			//else if there was an error, print the error to the console
			if data!.count > 0 && error == nil {
				self.extractJSON(jsonData: data! as NSData)
			} else if data!.count == 0 && error == nil {
				print("Nothing was downloaded")
			} else if error != nil {
				print("Error happened = \(error)")
			}
		}
	}
    
    //function to extract json tree from nsdata object and then extract data from the json tree
	func extractJSON(jsonData: NSData) {
			//try to parse the json data into an object, json
			let json: AnyObject? = try! JSONSerialization.jsonObject(with: jsonData as Data, options: .allowFragments) as AnyObject?
		
			//sets table equal to the Sheet1 json object (in this case the whole thing)
			if let table = json?["Sheet1"] as? NSArray{				
				//loop through all the announcements in the json object, table
                for i in stride(from: 0, to: table.count, by: 1) {
					if let plusObject = table[i] as? NSDictionary {
                        guard let plusDate = plusObject["Date"] as? String, let plusPlus = plusObject["Plus"] as? String
                            else {return}
                        let tempPlus = Plus(date: plusDate, plus: plusPlus)
                        tempPlusses += [tempPlus!]
                    }
			    }
            }
		
        plusses = tempPlusses
        tempPlusses.removeAll()
		savePlusses()
	}
}
