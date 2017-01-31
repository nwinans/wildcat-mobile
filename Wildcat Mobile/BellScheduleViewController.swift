//
// BellScheduleViewController.swift
// Wildcat Mobile
//
// Created by Nick Winans on 1/30/2017
// Copyright © 2017 Centreville HS. All rights reserved.
//

import UIKit

class BellScheduleViewController: UITableViewController {
    //regular bell schedule, separated into 5 blocks and 4 lunches
    let regBlock1 = "1st/2nd period"
    let regBlock1T = "8:10 - 9:43"
    let regBlock2 = "PLUS"
    let regBlock2T = "9:49 - 10:14"
    let regBlock3 = "3rd/4th period"
    let regBlock3T = "10:20 - 11:52"
    let regBlock4 = "5th/6th period"
    let regBlock4T = "11:58 - 2:01"
    let regBlock5 = "7th period"
    let regBlock5T = "2:08 - 2:55"
    let regBlockL1 = "1st Lunch"
	let regBlockL1T = "2st Lunch times go here"
  
    //2 hour early release block schedule, 4 blocks because no plus (and 4 lunches)
    let ereBlock1 = "look a bunny"
    let ereBlock2 = "(\\  /)"
    let ereBlock3 = "(='.'=)"
    let ereBlock4 = "(') (')"
	
    //2 hour delay schedule, 4 blocks becuase no plus (and 4 lunches)
    let delBlock1 = "1st/2nd period"
    let delBlock1T = "10:10 - 11:09"
    let delBlock2 = "3rd/4th period"
    let delBlock2T = "11:15 - 12:14"
    let delBlock3 = "5th/6th period"
    let delBlock3T = "12:20 - 2:24"
    let delBlock4 = "7th period"
    let delBlock4T = "2:30 - 2:55"
		
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
    }
	
    func magic(_ t: Int) -> Array<String> {
        switch t{
        case 0: return ["Regular Bell Schedule\n\n" + regBlock1 + "\n" + regBlock2 + "\n" + regBlock3 + "\n" + regBlock4 + "\n" + regBlock5, "\n\n" + regBlock1T + "\n" + regBlock2T + "\n" + regBlock3T + "\n" + regBlock4T + "\n" + regBlock5T]//todo: add lunches
        case 1: return ["2 Hour Delay\n\n" + delBlock1 + "\n" + delBlock2 + "\n" + delBlock3 + "\n" + delBlock4, "\n\n" + delBlock1T + "\n" + delBlock2T + "\n" + delBlock3T + "\n" + delBlock4T]
        default: return ["this hasn't been implemented yet.", "error"]
        }
    }
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
		
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "bell", for: indexPath as IndexPath) as UITableViewCell
		
		let zoolanderz = magic(indexPath.row)
		
		cell.textLabel!.text = zoolanderz[0]
        cell.detailTextLabel!.text = zoolanderz[1]
        cell.textLabel!.numberOfLines = 0
        cell.detailTextLabel!.numberOfLines = 0
		
		return cell
		
	}
		
}
