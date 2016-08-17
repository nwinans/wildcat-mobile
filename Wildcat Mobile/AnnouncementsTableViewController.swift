//
//  AnnouncementsTableViewController.swift
//  Wildcat Mobile
//
//	This ViewController handles the Announcements scene and downloads the JSON form of a database and parses it and then sets tableView with that information
//	TODO: add check if end date of announcement is before or after current data and include it if it is after the current date
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

	//Spreadsheet URL (script converts spreadsheet into JSON for downloading)
	var defaultSpreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1ZET4Sf4U3j-8kBuTRVEgk7szsESiwLss6OgaxSLIMik&sheet=Sheet1"
	
	//Called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
		
		//runs function to populate arrays with data and then eventaully refreshes the table with new data
		getDataFromURL(defaultSpreadsheetURL)
		
		//functions used to auto-resize the height of each row, using both seems redundant but for some reason is required
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		//setup refresh control
		refreshControl = UIRefreshControl()
		
		//set text of refresh control to string
		refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
		
		//when the user swipes down (and internally calls the ValueChanged function), the refresh function is called
		refreshControl!.addTarget(self, action: #selector(AnnouncementsTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
		
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
		return announcementArray.count
    }

    //Default TableView function when using DynamicPrototypes - sets up cell's labels to go with corrosponding arrays
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("announcementCell", forIndexPath: indexPath) as! AnnouncementTableViewCell

        cell.announcementLabel.text = announcementArray[indexPath.row]
		cell.nameLabel.text = nameArray[indexPath.row]
		cell.activityLabel.text = activityArray[indexPath.row]
		cell.dateLabel.text = dateArray[indexPath.row]
		
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
				
				//loop through all the announcements in the json object, table
				for var i in 0.stride(to: table.count, by: 1) {
					
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
										
										//check to see if the announcement is approved, or it is empty
										// if the announcement is empty, it prints a message to the console saying which announcement wasn't approved
										// if the announcement is approved, it adds all the relevant data into the relevant arrays
										if announcementApproved.isEmpty {
											print("The announcement \(announcementMessage) wasn't approved")
										} else {
											announcementArray.append(announcementMessage)
											nameArray.append(announcementName)
											dateArray.append("8/8/16")
											activityArray.append(announcementActivity)
										}
									}
								}
							}
						}
					}
				}
			}
		
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
		announcementArray.removeAll()
		activityArray.removeAll()
		nameArray.removeAll()
		dateArray.removeAll()
		
		//re-run the getDataFromURL function which is originally called when the view is first loaded
		getDataFromURL(defaultSpreadsheetURL)
		
		
		//sends information to sender that the table is done refreshing
		sender.endRefreshing()
	}
}
