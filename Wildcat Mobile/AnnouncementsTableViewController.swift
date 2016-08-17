//
//  AnnouncementsTableViewController.swift
//  Wildcat Mobile
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
	
	var isRefreshing = false

	//Spreadsheet URL (script converts spreadsheet into JSON for downloading)
	var defaultSpreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1ZET4Sf4U3j-8kBuTRVEgk7szsESiwLss6OgaxSLIMik&sheet=Sheet1"
	
	//Called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
		
		getDataFromURL(defaultSpreadsheetURL)
		
		tableView.estimatedRowHeight = 100
		tableView.rowHeight = UITableViewAutomaticDimension
		
		
		refreshControl = UIRefreshControl()
		refreshControl!.attributedTitle = NSAttributedString(string: "Pull to refresh")
		refreshControl!.addTarget(self, action: #selector(AnnouncementsTableViewController.refresh(_:)), forControlEvents: UIControlEvents.ValueChanged)
		
    }

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
		
		cell.nameLabel.sizeToFit()

        return cell
    }
	
	func getDataFromURL(url: String) {
		let timeout = 15.0
		let url = NSURL(string: url)
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: timeout)
		let queue = NSOperationQueue()
		NSURLConnection.sendAsynchronousRequest(urlRequest, queue: queue) { (response: NSURLResponse?, data: NSData?, error: NSError?) in
			if data!.length > 0 && error == nil {
				self.extractJSON(data!)
			} else if data!.length == 0 && error == nil {
				print("Nothing was downloaded")
			} else if error != nil {
				print("Error happened = \(error)")
			}
		}
	}
	
	func doTableRefresh() {
		
		dispatch_async(dispatch_get_main_queue(), {
			self.tableView.reloadData()
			return
		})
		
	}
	
	func extractJSON(jsonData: NSData) {
			let json: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: .AllowFragments)
			
			if let table = json?["Sheet1"] as? NSArray{
			
				for var i in 0.stride(to: table.count, by: 1) {
					if let announcementObject = table[i] as? NSDictionary {
						if let announcementApproved = announcementObject["Approved"] as? String {
							if let announcementMessage = announcementObject["What_is_the_announcement?"] as? String {
								if let announcementName = announcementObject["What_is_your_name?"] as? String {
									if let announcementActivity = announcementObject["What_activity_is_this_announcement_related?"] as? String {
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
		
		doTableRefresh();
	}
	
	
	@IBAction func refresh(sender: UIRefreshControl) {
		announcementArray.removeAll()
		activityArray.removeAll()
		nameArray.removeAll()
		dateArray.removeAll()
		
		getDataFromURL(defaultSpreadsheetURL)
		
		sender.endRefreshing()
	}
	
	
	

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
