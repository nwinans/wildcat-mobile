//
//  ClubsViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/25/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class ClubsViewController: UITableViewController {
	
	let kCloseCellHeight: CGFloat = 60
	let kOpenCellHeight: CGFloat = 130
	
	var cellHeights = [CGFloat]()
	
	var clubTitles = [String]()
	var clubSponsors = [String]()
	var clubDescriptions = [String]()
	
	let spreadsheetURL = "https://script.google.com/macros/s/AKfycbxOLElujQcy1-ZUer1KgEvK16gkTLUqYftApjNCM_IRTL3HSuDk/exec?id=1Mu8Wn1CeEr7ehC4TYEUHmA-iVMknJF0c4Hpu-bJZvqY&sheet=Sheet1"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		getDataFromURL(spreadsheetURL)
	}
	
	// MARK: configure
	func createCellHeightsArray() {
		for _ in 1...clubTitles.count {
			cellHeights.append(kCloseCellHeight)
		}
	}
	
	override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return clubTitles.count
	}
	
	override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
		if cellHeights.count == 0 {
			return 60
		} else {
			return cellHeights[indexPath.row]
		}
	}
	
	override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("FoldingCell", forIndexPath: indexPath) as! ClubsCell
		
		cell.basicClubTitle.text = clubTitles[indexPath.row]
		cell.moreClubTitle.text = clubTitles[indexPath.row]
		cell.moreClubSponsor.text = "Sponsor(s): " + clubSponsors[indexPath.row]
		cell.moreClubDescription.text = "Description: " + clubDescriptions[indexPath.row]
		
		return cell
	}
	
	override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
		let cell = tableView.cellForRowAtIndexPath(indexPath) as! FoldingCell
		
		var duration = 0.0
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
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalCacheData, timeoutInterval: timeout)
		
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
			for var i in 0.stride(to: table.count, by: 1) {
				
				//sets clubObject equal to to the current object in the table array as type NSDictionary
				if let clubObject = table[i] as? NSDictionary {
					
					let active = clubObject["show_flag"] as? Int
					
					if active! == 1 {
						let clubTitle = clubObject["name"] as? String
						let clubSponsor = clubObject["sponsor"] as? String
						let clubDescription = clubObject["description"] as? String
						
						clubTitles.append(clubTitle!)
						clubSponsors.append(clubSponsor!)
						clubDescriptions.append(clubDescription!)
						
						self.tableView.reloadData()
					} else {
						print("club not yet active")
					}
				}
			}
		
		
		}
		
		//refresh the table with the new information
		
		
		
		createCellHeightsArray()
	}
	
	
	//function to refresh the table on the main queue
	func doTableRefresh() {
		
		dispatch_async(dispatch_get_main_queue(), {
			//sleep(4)
			
			return
		})
		
	}


}
