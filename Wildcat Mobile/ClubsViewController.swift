//
//  ClubsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/25/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClubsViewController: UITableViewController {
	
	//set the height of the default, "closed", cell
	let kCloseCellHeight: CGFloat = 60
	//set the height of the "opened" cell
	let kOpenCellHeight: CGFloat = 170
	
	//create an array of float variables that will hold the realtime heights of the cells
	var cellHeights = [CGFloat]()
	
	//create arrays of the clubs' information
	var clubTitles = [String]()
	var clubSponsors = [String]()
	var clubDescriptions = [String]()
	var clubContacts = [String]()
	
	//link to spreadsheet - includes script to convert google spreadsheet to JSON
	let spreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1Mu8Wn1CeEr7ehC4TYEUHmA-iVMknJF0c4Hpu-bJZvqY&sheet=Sheet1"
	
	//default function called when the view has loaded
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//clear all the clubs' details - precautionary measure that will help prevent occasional crashes
		cellHeights.removeAll(keepCapacity: false)
		clubTitles.removeAll(keepCapacity: false)
		clubDescriptions.removeAll(keepCapacity: false)
		clubContacts.removeAll(keepCapacity: false)
		
		//run function to download the club data
		getDataFromURL(spreadsheetURL)
	}
	
	// function called to add every cell's height to the cellHeights array
	func createCellHeightsArray() {
		//remove every cell height as a precautionary measure
		cellHeights.removeAll(keepCapacity: false)
		//apend kCloseCellHeight to cellHeights once for every cell
		for _ in 1...clubTitles.count {
			cellHeights.append(kCloseCellHeight)
		}
	}
	
	//required function to provide the number of cells
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return clubTitles.count
	}
	
	//optional function that allows each cell to have a different height
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		//if there are no cells, return the default 60
		if cellHeights.count == 0 {
			return 60
		} else {
			//return the height of each cell from the cell heights array
			return cellHeights[indexPath.row]
		}
	}
	
	//optional function to set each cells' information to it's corrosponding information from the arrays
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		//initialize the cell variable to be equal to the cell from the storyboard with the identifer - "FoldingCell"
		let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath) as! ClubsCell
		
		//set labels in the cell to the corrosponding information
		cell.basicClubTitle.text = clubTitles[indexPath.row]
		cell.moreClubTitle.text = clubTitles[indexPath.row]
		cell.moreClubSponsor.text = "Sponsor(s): " + clubSponsors[indexPath.row]
		cell.moreClubDescription.text = "Description: " + clubDescriptions[indexPath.row]
		
		//set the club contact email (not a label but a variable in the ClubsCell class) to the corrosponding email
		cell.contactEmail = clubContacts[indexPath.row]
		
		return cell
	}
	
	//function to send an email to a given email address
	func sendEmail(email:String) {
		UIApplication.sharedApplication().openURL(NSURL(string: "mailto://" + email)!)
	}
	
	//optional funciton called when a cell is selected
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
		
		//set the duration equal to a basic float value
		var duration = 0.0
		//if the selected cell's height is the same as the closed cell height...
		if cellHeights[indexPath.row] == kCloseCellHeight { // open cell
			cellHeights[indexPath.row] = kOpenCellHeight
			cell.selectedAnimation(true, animated: true, completion: nil)
			duration = 0.5
		} else {// close cell
			cellHeights[indexPath.row] = kCloseCellHeight
			cell.selectedAnimation(false, animated: true, completion: nil)
			duration = 0.8
		}
		
		UIView.animateWithDuration(duration, delay: 0, options: .CurveEaseOut, animations: { () -> Void in
			tableView.beginUpdates()
			tableView.endUpdates()
			}, completion: nil)
	}
	
	override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
		
		guard case let cell as ClubsCell = cell else {
			return
		}
		
		if cellHeights[indexPath.row] == kCloseCellHeight {
			cell.selectedAnimation(false, animated: false, completion:nil)
		} else {
			cell.selectedAnimation(true, animated: false, completion: nil)
		}
	}
	
	
	//function to download JSON data from server
	func getDataFromURL(url: String) {
		
		let timeout = 15.0
		let url = NSURL(string: url)
		
		//setup url request with url, default cache policy, and timeout length
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReturnCacheDataElseLoad, timeoutInterval: timeout)
		
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
			
			//loop through all the clubs in the json object, table
			for i in 0.stride(to: table.count, by: 1) {
				
				//sets clubObject equal to to the current object in the table array as type NSDictionary
				if let clubObject = table[i] as? NSDictionary {
					
					let active = clubObject["show_flag"] as? Int
					
					if active! == 1 {
						let clubTitle = clubObject["name"] as? String
						let clubSponsor = clubObject["sponsor"] as? String
						let clubDescription = clubObject["description"] as? String
						let clubContact = clubObject["contact_email"] as? String
						
						clubTitles.append(clubTitle!)
						clubSponsors.append(clubSponsor!)
						clubDescriptions.append(clubDescription!)
						clubContacts.append(clubContact!)
						
					} else {
						print("club not yet active")
					}
				}
			}
		
		
		}
		
		//refresh the table with the new information
		
		
		doTableRefresh()
		createCellHeightsArray()
	}
	
	
	//function to refresh the table on the main queue
	func doTableRefresh() {
		
		dispatch_async(dispatch_get_main_queue(), {
			//sleep(4)
			
			self.tableView.reloadData()
			return
		})
		
	}


}
