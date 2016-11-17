//
//  AnnouncementsTableViewController.swift
//  Wildcat Mobile
//
//This ViewController handles the Announcements scene and downloads the JSON form of a database and parses it and then sets tableView with that information
//We store previously loaded announcements and load them when the app loads to give the illusion of a faster loading app
//
//  Created by Nicholas Winans on 8/15/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class AnnouncementsTableViewController: UITableViewController {
	
	var announcements = [AnnouncementObject]()
	var tempAnnouncements = [AnnouncementObject]()
	
    	//get plus bar button from storyboard
    	@IBOutlet weak var plusButton: UIBarButtonItem!

	//Spreadsheet URL (script converts spreadsheet into JSON for downloading)
	var defaultSpreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1ZET4Sf4U3j-8kBuTRVEgk7szsESiwLss6OgaxSLIMik&sheet=Sheet1"
	
	//Called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
		
        //set bar button to current plus
        plusButton.title = PlusSchedule().plus()
	    
		//functions used to auto-resize the height of each row, using both seems redundant but for some reason is required
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		//setup refresh control
		refreshControl = UIRefreshControl()
		
		//set text of refresh control to string
		refreshControl!.attributedTitle = NSAttributedString(string: "Refresh")
		
		//when the user swipes down (and internally calls the ValueChanged function), the refresh function is called
		refreshControl!.addTarget(self, action: #selector(refresh(_:)), for: UIControlEvents.valueChanged)
		
        if let savedAnnouncements = loadAnnouncements() {
			announcements += savedAnnouncements
		}
        
        //runs function to populate arrays with data and then eventaully refreshes the table with new data
        getDataFromURL(url: defaultSpreadsheetURL)
    }
	func saveAnnouncements() {
		let isSaveSuccessful = NSKeyedArchiver.archiveRootObject(announcements, toFile: AnnouncementObject.ArchiveURL.path)
		if !isSaveSuccessful {
			print("failed to save")
		}
	}
	
	func loadAnnouncements() -> [AnnouncementObject]? {
		return NSKeyedUnarchiver.unarchiveObject(withFile: AnnouncementObject.ArchiveURL.path) as? [AnnouncementObject]
	}

	//Default TableView function when using Dynamic Protoypes - We only have one section of announcements currently, so we just return 1
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

	//Default TableView function when using Dynamic Prototypes - we will always have an announcement so we pass the length of the announcementArray
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return announcements.count
    }

    //Default TableView function when using DynamicPrototypes - sets up cell's labels to go with corrosponding arrays
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "announcementCell", for: indexPath as IndexPath) as! AnnouncementTableViewCell

		//get announcement str from array
		let str = announcements[indexPath.row].announcement
		
		//replace escaped new line chars from JSON to the actual \n character
		let labelString = str.replacingOccurrences(of: "\\n", with: "\n")
		
		//set the labels in the cell to the appriopriate string from the announcement array
        cell.announcementLabel.text = labelString
        cell.nameLabel.text = announcements[indexPath.row].name
        cell.activityLabel.text = announcements[indexPath.row].activity
        cell.dateLabel.text = announcements[indexPath.row].date
        
        return cell
    }
	
	//function to download JSON data from server
	func getDataFromURL(url: String) {
		
		let timeout = 30.0
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
					
					//sets announcementObject equal to to the current object in the table array as type NSDictionary
					if let announcementObject = table[i] as? NSDictionary {
						
                        guard let anApproved = announcementObject["Approved"] as? String, let anMessage = announcementObject["What_is_the_announcement?"] as? String, let anName = announcementObject["What_is_your_name?"] as? String, let anActivity = announcementObject["What_activity_is_this_announcement_related?"] as? String, let anTimestamp = announcementObject["Timestamp"] as? String, let anExpiration = announcementObject["Until_when_should_this_announcement_be_shown?"] as? String
                            
                            else { return }
                        
                        
                            //set current date to constant called currentDate
                            let currentDate: NSDate = NSDate()
												
                            //Create NSDateFormatter to parse times into NSDates
                            let formatter = DateFormatter()
												
                            //set timezone of formatter to east coast
                            formatter.timeZone = NSTimeZone.default
												
                            //set dateFormat of formatter to IRFC 3339 (the format that google spreadsheets saves in)
                            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS'Z'"
												
                            //create NSDates for timestamp and expiration date
                            let timestamp = formatter.date(from: anTimestamp)
                            let expiraton = formatter.date(from: anExpiration)
												
                            //check to see if the announcement is still valid, or if it has expired
                            //	if it is valid, check to see if announcement is approved
                            //	if the announcement is expired, it prints a message saying which annoncement is expired
												
                            if (expiraton?.compare(currentDate as Date) == .orderedDescending) {
													
                            //check to see if the announcement is approved, or it is empty
                            // if the announcement isnt approved, it prints a message to the console saying which announcement wasn't approved
                            // if the announcement is approved, it adds all the relevant data into the relevant arrays
                            if anApproved.isEmpty {
                                    print("The announcement \(anMessage) wasn't approved")
                            } else {
                                //Format timestamp as desired format ("Month, Day, Year")
                                let dateFormatter = DateFormatter()
                                dateFormatter.dateFormat = "MM/dd"
                                let date = dateFormatter.string(from: timestamp!)
														
                                let tempAnnouncement = AnnouncementObject(activity: anActivity, announcement: anMessage, date: date, name: anName)
                                                        
                                tempAnnouncements += [tempAnnouncement!]
														
                            }
                        } else {
                            print("The announcement \(anMessage) has expired")
                        }
					}
				}
			}
		//create variable to test equality of old and new announcements
        	var isEqual = true
        
		//if the length isn't equal, then the announcements aren't equal
        	if announcements.count != tempAnnouncements.count {
            		isEqual = false
        	} else {
			//loop through every announcement and if one isn't equal, set isEqual to false
                for i in stride(from:0, to: announcements.count, by: 1) {
                		if !announcements[i].equals(compareTo: tempAnnouncements[i]) {
                    			isEqual = false
                		} 
            		}
		}

		//if the old and new announcement are the same, we don't need to worry about reloading the table
        if !isEqual{
			//set the announcements to new announcments
        		announcements = tempAnnouncements

			//remove all announcements from the tempAnnouncement variable (so refreshing won't make duplicates)
        		tempAnnouncements.removeAll()
		
			//save the announcements to the disk 
			saveAnnouncements()
			
			//refresh the table with the new information
           		doTableRefreshWithAnimation()
        } else {
            tempAnnouncements.removeAll()
        }
	}
	
	//function to refresh the table on the main queue
	func doTableRefreshWithAnimation() {
		
        DispatchQueue.main.async(execute: {
			let range = NSMakeRange(0, self.tableView.numberOfSections)
            let sections = NSIndexSet(indexesIn: range)
            
            self.tableView.reloadSections(sections as IndexSet, with: .automatic)
			return
		})
	}
	
	//storyboard outlet (action) to handle the swipe to refresh feature
	func refresh(_ sender: UIRefreshControl) {
				
		//re-run the getDataFromURL function which is originally called when the view is first loaded
		getDataFromURL(url: defaultSpreadsheetURL)
		
		//sends information to sender that the table is done refreshing
		sender.endRefreshing()
	}
    
		
}
