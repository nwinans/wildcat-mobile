//
//  AnnouncementsTableViewController.swift
//  Wildcat Mobile
//
//	This ViewController handles the Announcements scene and downloads the JSON form of a database and parses it and then sets tableView with that information
//
//  Created by Nicholas Winans on 8/15/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class AnnouncementsTableViewController: UITableViewController {
	
	//Make arrays for data storage as type Array<String> and assign it an empty string array
	var announcementArray:Array<String> = Array<String>()
	var nameArray:Array<String> = Array<String>()
	var activityArray: Array<String> = Array<String>()
	var dateArray: Array<String> = Array<String>()
	
	var announcements = [AnnouncementObject]()
	var tempAnnouncements = [AnnouncementObject]()
	
	var singleAnnouncment: AnnouncementObject?
	   
	//Create variable to hold the result of the JSON download. We use this later when the user refreshes to see if the new data is different
	var jsonCache: AnyObject?
	
    	//get plus bar button from storyboard
    	@IBOutlet weak var plusButton: UIBarButtonItem!

	//Spreadsheet URL (script converts spreadsheet into JSON for downloading)
	var defaultSpreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1ZET4Sf4U3j-8kBuTRVEgk7szsESiwLss6OgaxSLIMik&sheet=Sheet1"
	
	//Called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
		
        //set bar button to current plus
        plusButton.title = PlusSchedule().plus()
        
	    //runs function to populate arrays with data and then eventaully refreshes the table with new data
		//getDataFromURL(defaultSpreadsheetURL)
	    
		//functions used to auto-resize the height of each row, using both seems redundant but for some reason is required
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		//setup refresh control
		refreshControl = UIRefreshControl()
		
		//set text of refresh control to string
		refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
		
		//when the user swipes down (and internally calls the ValueChanged function), the refresh function is called
		refreshControl!.addTarget(self, action: #selector(AnnouncementsTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
		
	    	if let savedAnnouncements = loadAnnouncements() {
			announcements += savedAnnouncements
		} else {
			//runs function to populate arrays with data and then eventaully refreshes the table with new data
			getDataFromURL(defaultSpreadsheetURL)
		}
	    
    }
	
	func saveAnnouncements() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(announcements, AnnouncementObject.ArchiveURL!.path!)
		if !isSaveSuccessful {
			print("failed to save")
		}
	}
	
	func loadClasses -> [AnnouncementObject]? {
		return NSKeyedUnarchiver.unarchiveObjectWithFile(AnnouncementObject.ArchiveURL!.path!) as? [ClassObject]

	//unused default function
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

	//Default TableView function when using Dynamic Protoypes - We only have one section of announcements currently, so we just return 1
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

	//Default TableView function when using Dynamic Prototypes - we will always have an announcement so we pass the length of the announcementArray
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return announcements.count//announcementArray.count
    }

    //Default TableView function when using DynamicPrototypes - sets up cell's labels to go with corrosponding arrays
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("announcementCell", forIndexPath: indexPath) as! AnnouncementTableViewCell

        cell.announcementLabel.text = announcements[index].announcement//announcementArray[indexPath.row]
	cell.nameLabel.text = announcements[index].name//nameArray[indexPath.row]
	cell.activityLabel.text = announcements[index].activity//activityArray[indexPath.row]
	cell.dateLabel.text = announcements[index].date//dateArray[indexPath.row]
		
        return cell
    }
	
	//function to download JSON data from server
	func getDataFromURL(url: String) {
		
		let timeout = 15.0
		let url = NSURL(string: url)
		
		//setup url request with url, default cache policy, and timeout length
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.UseProtocolCachePolicy, timeoutInterval: timeout)
		
		let queue = NSOperationQueue()
		
		//actually get the information asynchronously
		NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue) { (response: NSURLResponse?, data: NSData?, error: NSError?) in
			
			//if the data has length and there was no error, extract the JSON tree from the data
			//else if the data length is 0 and there was no error, print a message to the console that there was nothing to download at the url
			//else if there was an error, print the error to the console
			if data!.length > 0 && error == nil {
				self.extractJSON(data!)
			} else if data!.length == 0 && error == nil {
				print("Nothing was downloaded")
			} else if error != nil {
				print("Error happened = \(error)")
			}
		}
	}
	
	
	//function to extract json tree from nsdata object and then extract data from the json tree
	func extractJSON(jsonData: NSData) {
			//try to parse the json data into an object, json
			let json: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
		
			//sets table equal to the Sheet1 json object (in this case the whole thing)
			if let table = json?["Sheet1"] as? NSArray{
				
				//check to see if we have previously retrieved data in this session
				if (jsonCache != nil) {
					//if the data hasn't changed since the last refresh
					if (jsonCache == table) {
						//break the function
						break
					} else {
						//remove all the data from the arrays
						announcementArray.removeAll(keepCapacity: false)
						activityArray.removeAll(keepCapacity: false)
						nameArray.removeAll(keepCapacity: false)
						dateArray.removeAll(keepCapacity: false)
					}
				}
				
				//set the cache variable to the new data retrieved
				jsonCache = table
				
				//loop through all the announcements in the json object, table
				for i in 0.stride(to: table.count, by: 1) {
					
					//sets announcementObject equal to to the current object in the table array as type NSDictionary
					if let announcementObject = table[i] as? NSDictionary {
						
						//sets announcementApproved equal to the "Approved" json object
						if let announcementApproved = announcementObject["Approved"] as? String {
							
							//sets announcementMessage equal to the announcement object
							if let announcementMessage = announcementObject["What_is_the_announcement?"] as? String {
								
								//sets announcementName equal to the name of the person who is sending the announcement
								if let announcementName = announcementObject["What_is_your_name?"] as? String {
									
									//sets announcementActivity equal to the activity the announcement is related to
									if let announcementActivity = announcementObject["What_activity_is_this_announcement_related?"] as? String {
										
										//sets announcementTimestamp equal to the time the announcement was created
										if let announcementTimestamp = announcementObject["Timestamp"] as? String {
											
											//sets announcementExpiration to the expiraton date of the announcement
											if let announcementExpiration = announcementObject["Until_when_should_this_announcement_be_shown?"] as? String{
												
												//set current date to constant called currentDate
												let currentDate: NSDate = NSDate()
												
												//Create NSDateFormatter to parse times into NSDates
												let formatter = NSDateFormatter()
												
												//set timezone of formatter to east coast
												formatter.timeZone = NSTimeZone.defaultTimeZone()
												
												//set dateFormat of formatter to IRFC 3339 (the format that google spreadsheets saves in)
												formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
												
												//create NSDates for timestamp and expiration date
												let timestamp = formatter.dateFromString(announcementTimestamp)
												let expiraton = formatter.dateFromString(announcementExpiration)
												
												//check to see if the announcement is still valid, or if it has expired
												//	if it is valid, check to see if announcement is approved
												//	if the announcement is expired, it prints a message saying which annoncement is expired
												
												if (expiraton?.compare(currentDate) == .OrderedDescending) {
													
													//check to see if the announcement is approved, or it is empty
													// if the announcement isnt approved, it prints a message to the console saying which announcement wasn't approved
													// if the announcement is approved, it adds all the relevant data into the relevant arrays
													if announcementApproved.isEmpty {
														print("The announcement \(announcementMessage) wasn't approved")
													} else {
														//Format timestamp as desired format ("Month, Day, Year")
														let dateFormatter = NSDateFormatter()
														dateFormatter.dateFormat = "MM/dd"
														let date = dateFormatter.stringFromDate(timestamp!)
														
														let tempAnnouncement = AnnouncementObject(activity: announcementActivity, announcement: announcementMessage, name: announcementName, date: date
														
														tempAnnouncements += tempAnnouncement
														
														//announcementArray.append(announcementMessage)
														//nameArray.append(announcementName)
														//dateArray.append(date)
														//activityArray.append(announcementActivity)
													}
												} else {
													print("The announcement \(announcementMessage) has expired")
												}
												
											}
											
										}
									}
								}
							}
						}
					}
				}
			}
		
		var lenOld = announcements.count
		var lenNew = tempAnnouncements.count
				
		if (lenNew == 0) {
			announcements.removeAll()
		} else {
			for index 1...lenNew {
				if (announcements.contains(tempAnnouncements[index])) {
					//do nothing
				} else {
					announcement += tempAnnouncements[index]))
				}
				
				if (announcements.count != lenNew) {
					for index 1...announcements.count {
						if tempAnnouncements.contains(announcements[index]) {
							//do nothing
						} else {
							announcements.removeAtIndex(index)
						}
					}
				}
			}
		}
		
		saveAnnouncements()
			
		//refresh the table with the new information
		doTableRefresh();
	}
	
	
	//function to refresh the table on the main queue
	func doTableRefresh() {
		
		dispatch_async(dispatch_get_main_queue(), {
			self.tableView.reloadData()
			return
		})
		
	}
	
	//storyboard outlet (action) to handle the swipe to refresh feature
	@IBAction func refresh(sender: UIRefreshControl) {
		
		//remove all data from the arrays to prevent duplicate data
		/*announcementArray.removeAll(keepCapacity: false)
		activityArray.removeAll(keepCapacity: false)
		nameArray.removeAll(keepCapacity: false)
		dateArray.removeAll(keepCapacity: false)
		
		//notify the tableView that it's data has changed (it will remove all items from the tableView temporarily)
		//There is probably a better way to handle this because if the data doesn't reload for whatever reason, then the table will remain blank
		self.tableView.reloadData()*/
		
		//re-run the getDataFromURL function which is originally called when the view is first loaded
		getDataFromURL(defaultSpreadsheetURL)
		
		//sends information to sender that the table is done refreshing
		sender.endRefreshing()
	}
					
	extension Array where Element : Equatable {
		 // Remove first collection element that is equal to the given `object`:
    mutating func removeObject(object : Generator.Element) {
        if let index = self.indexOf(object) {
            self.removeAtIndex(index)
        }
    }
	}
}
