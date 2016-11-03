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
	
	var announcements = [AnnouncementObject]()
	var tempAnnouncements = [AnnouncementObject]()
	
	var singleAnnouncment: AnnouncementObject?
	   
	//Create variable to hold the result of the JSON download. We use this later when the user refreshes to see if the new data is different
	//var jsonCache: AnyObject?
	
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
		}
        
        //runs function to populate arrays with data and then eventaully refreshes the table with new data
        getDataFromURL(defaultSpreadsheetURL)
    }


	
	func saveAnnouncements() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(announcements, toFile: AnnouncementObject.ArchiveURL!.path!)
		if !isSaveSuccessful {
			print("failed to save")
		}
	}
	
	func loadAnnouncements() -> [AnnouncementObject]? {
		return NSKeyedUnarchiver.unarchiveObjectWithFile(AnnouncementObject.ArchiveURL!.path!) as? [AnnouncementObject]
    }

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

        cell.announcementLabel.text = announcements[indexPath.row].announcement
        cell.nameLabel.text = announcements[indexPath.row].name
        cell.activityLabel.text = announcements[indexPath.row].activity
        cell.dateLabel.text = announcements[indexPath.row].date
        
        return cell
    }
	
	//function to download JSON data from server
	func getDataFromURL(url: String) {
		
		let timeout = 15.0
		let url = NSURL(string: url)
		
		//setup url request with url, default cache policy, and timeout length
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeout)
		
		let queue = NSOperationQueue()
		
		//actually get the information asynchronously
		NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue) { (response: NSURLResponse?, data: NSData?, error: NSError?) in
			
            if data == nil {
                return
            }
            
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
	
    func uniq<S : SequenceType, T : Hashable where S.Generator.Element == T>(source: S) -> [T] {
        var buffer = [T]()
        var added = Set<T>()
        for elem in source {
            if !added.contains(elem) {
                buffer.append(elem)
                added.insert(elem)
            }
        }
        return buffer
    }
	
	//function to extract json tree from nsdata object and then extract data from the json tree
	func extractJSON(jsonData: NSData) {
			//try to parse the json data into an object, json
			let json: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
		
			//sets table equal to the Sheet1 json object (in this case the whole thing)
			if let table = json?["Sheet1"] as? NSArray{
								
				//loop through all the announcements in the json object, table
				for i in 0.stride(to: table.count, by: 1) {
					
					//sets announcementObject equal to to the current object in the table array as type NSDictionary
					if let announcementObject = table[i] as? NSDictionary {
						
						//sets announcementApproved equal to the "Approved" json object
						if let announcementApproved = announcementObject["Approved"] as? String {
                            
                            if announcementApproved.isEmpty {
                                return
                            }
                            
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
														
														let tempAnnouncement = AnnouncementObject(activity: announcementActivity, announcement: announcementMessage, date: date, name: announcementName)
                                                        
														tempAnnouncements += [tempAnnouncement!]
														
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
		
        announcements = tempAnnouncements

        tempAnnouncements.removeAll()
		
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
				
		//re-run the getDataFromURL function which is originally called when the view is first loaded
		getDataFromURL(defaultSpreadsheetURL)
		
		//sends information to sender that the table is done refreshing
		sender.endRefreshing()
	}
		
}
