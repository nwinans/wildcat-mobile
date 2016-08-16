//
//  AnnouncementsTableViewController.swift
//  Wildcat Mobile
//
//  Created by Nicholas Winans on 8/15/16.
//  Copyright © 2016 Centreville HS. All rights reserved.
//

import UIKit

class AnnouncementsTableViewController: UITableViewController {

	//Get UI Table View from Announcement Scene on Storyboard and set it as mTableView reference
	@IBOutlet var mTableView: UITableView!
	
	
	//Make variable named tableData as type Array<String> and assign it an empty string array
	var tableData:Array<String> = Array<String>()
	
	//var defaultSpreadsheatURL = "https://spreadsheets.google.com/tq?key=17xalaHNqjOMFq7FcHfgSMXaNpibj9DgzQ0TJuxf1r-Q"
	var defaultSpreadsheatURL = "http://www.kaleidosblog.com/tutorial/tutorial.json"
	
	//Called when the view has loaded
    override func viewDidLoad() {
        super.viewDidLoad()
		
		getDataFromURL(defaultSpreadsheatURL)

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return tableData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("announcementCell", forIndexPath: indexPath)

        cell.textLabel?.text = tableData[indexPath.row]

        return cell
    }
	
	func getDataFromURL(url: String) {
		let httpMethod = "GET"
		let timeout = 15
		let url = NSURL(string: url)
		let urlRequest = NSMutableURLRequest(URL: url!, cachePolicy: NSURLRequestCachePolicy.ReloadIgnoringLocalAndRemoteCacheData, timeoutInterval: 15.0)
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
	
	func extractJSON(jsonData: NSData) {
		var parseError: NSError?
		do {
			 let json: AnyObject? = try! NSJSONSerialization.JSONObjectWithData(jsonData, options: [])
			
			if let countriesList = json as? NSArray{
				for (var i = 0; i < countriesList.count; i += 1) {
					if let countryObj = countriesList[i] as? NSDictionary{
						if let countryName = countryObj["country"] as? String{
							if let countryCode = countryObj["code"] as? String{
								tableData.append(countryName + " [" + countryCode + "]")
							}
						}
					}
				}
			}
			
			doTableRefresh();
			
		} catch {
			print("There was an error in NSJSONSerialization")
		}
	}
	
	func doTableRefresh() {
		
		dispatch_async(dispatch_get_main_queue(), {
			self.tableView.reloadData()
			return
		})
		
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
