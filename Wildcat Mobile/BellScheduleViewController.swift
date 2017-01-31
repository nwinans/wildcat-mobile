//
// BellScheduleViewController.swift
// Wildcat Mobile
//
// Created by Nick Winans on 1/30/2017
// Copyright © 2017 Centreville HS. All rights reserved.
//
//regBlock = regular block schedule
//ereBlock = 2 hour early release block schedule
//delBlock = 2 hour delay block schedule

import UIKit

class BellScheduleViewController: UITableViewController {
    //regular bell schedule, separated into 5 blocks and 4 lunches
    var regBlock = [String]()
    var regBlockT = [String]()
    var ereBlock = Array<String>()
    var ereBlockT = Array<String>()
    var delBlock = Array<String>()
    var delBlockT = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableViewAutomaticDimension
        
        regBlock.append("1st/2nd period")
        regBlockT.append("8:10 - 9:43")
        regBlock.append("PLUS")
        regBlockT.append("9:49 - 10:14")
        regBlock.append("3rd/4th period")
        regBlockT.append("10:20 - 11:52")
        regBlock.append("5th/6th period")
        regBlockT.append("11:58 - 2:01")
        regBlock.append("7th period")
        regBlockT.append("2:08 - 2:55")
        
        /*regBlock.append("1st Lunch")
        regBlockT.append("11:52 - 12:20")*/
        /*regBlock.append("2nd Lunch")
        regBlockT.append("12:25 - 12:54")
        regBlock.append("3rd Lunch")
        regBlockT.append("12:59 - 1:28")
        regBlock.append("4th Lunch")
        regBlockT.append("1:33 - 2:01")*/
        regBlock.append("1st Lunch\n2nd Lunch\n3rd Lunch\n4th Lunch")
        regBlockT.append("11:52 - 12:20\n12:25 - 12:54\n12:59 - 1:28\n1:33 - 2:01")
        
        //2 hour early release block schedule, 4 blocks because no plus (and 4 lunches)
        ereBlock.append("1st/2nd period")
        ereBlockT.append("8:10 - 9:03")
        ereBlock.append("3rd/4th period")
        ereBlockT.append("9:08 - 10:06")
        //switch 7th period right?
        ereBlock.append("7th period")
        ereBlockT.append("10:11 - 10:47")
        ereBlock.append("5th/6th period")
        ereBlockT.append("10:52 - 12:55")
        
        /*ereBlock.append("1st Lunch")
        ereBlockT.append("10:47 - 11:16")
        ereBlock.append("2nd Lunch")
        ereBlockT.append("11:21 - 11:49")
        ereBlock.append("3rd Lunch")
        ereBlockT.append("11:54 - 12:23")
        ereBlock.append("4th Lunch")
        ereBlockT.append("12:28 - 12:55")*/
        ereBlock.append("1st Lunch\n2nd Lunch\n3rd Lunch\n4th Lunch")
        ereBlockT.append("10:47 - 11:16\n11:21 - 11:49\n11:58 - 12:23\n12:28 - 12:55")
        
        //2 hour delay schedule, 4 blocks becuase no plus (and 4 lunches)
        let delBlock1 = "1st/2nd period"
        let delBlock1T = "10:10 - 11:09"
        let delBlock2 = "3rd/4th period"
        let delBlock2T = "11:15 - 12:14"
        let delBlock3 = "5th/6th period"
        let delBlock3T = "12:20 - 2:24"
        let delBlock4 = "7th period"
        let delBlock4T = "2:30 - 2:55"
        let delBlockL1 = "1st Lunch"
        let delBlockL1T = "12:14 - 12:43"
        let delBlockL2 = "2nd Lunch"
        let delBlockL2T = "12:48 - 1:17"
        let delBlockL3 = "3rd Lunch"
        let delBlockL3T = "1:22 - 1:50"
        let delBlockL4 = "4th Lunch"
        let delBlockL4T = "1:55 - 2:24"

    }
	
    func magic(_ r: Int, _ s: Int) -> Array<String> {
        switch s{
        case 0: return potion(regBlock, regBlockT, r)
        case 1: return potion(ereBlock, ereBlockT, r)
        default: return ["this hasn't been implemented yet.", "error"]
        }
    }
    
    func potion(_ p: Array<String>, _ t: Array<String>, _ r: Int) -> Array<String> {
        return [p[r], t[r]]
    }
    
    func wand(_ t: Int) -> Int {
        switch t {
        case 0: return regBlock.count
        case 1: return ereBlock.count
        default: return 0
        }
    }
    
    func voldemortz() -> Int {
        return 3
    }
	
    override func numberOfSections(in tableView: UITableView) -> Int {
        return voldemortz()
    }
	
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return wand(section)
    }
		
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "bell", for: indexPath as IndexPath) as UITableViewCell
		
		let zoolanderz = magic(indexPath.row, indexPath.section)
		cell.textLabel!.text = zoolanderz[0]
        cell.detailTextLabel!.text = zoolanderz[1]
        
        if indexPath.section == 0 && indexPath.row == 5 {
            cell.textLabel!.numberOfLines = 4
            cell.detailTextLabel!.numberOfLines = 4
        } else if indexPath.section == 1 && indexPath.row == 4 {
            cell.textLabel!.numberOfLines = 4
            cell.detailTextLabel!.numberOfLines = 4
        }
		return cell
	}
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0: return "Regular Bell Schedule"
        case 1: return "2 Hour Early Release Bell Schedule"
        case 2: return "2 Hour Delay Bell Schedule"
        default: return "you're a wizard harry"
        }
    }
		
}
