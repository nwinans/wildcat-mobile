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
        //lunches
        regBlock.append("1st Lunch\n2nd Lunch\n3rd Lunch\n4th Lunch")
        regBlockT.append("11:52 - 12:20\n12:25 - 12:54\n12:59 - 1:28\n1:33 - 2:01")
        
        //2 hour early release block schedule, 4 blocks because no plus (and 4 lunches)
        ereBlock.append("1st/2nd period")
        ereBlockT.append("8:10 - 9:03")
        ereBlock.append("3rd/4th period")
        ereBlockT.append("9:08 - 10:06")
        //switch 7th period
        ereBlock.append("7th period")
        ereBlockT.append("10:11 - 10:47")
        ereBlock.append("5th/6th period")
        ereBlockT.append("10:52 - 12:55")
        //lunches
        ereBlock.append("1st Lunch\n2nd Lunch\n3rd Lunch\n4th Lunch")
        ereBlockT.append("10:47 - 11:16\n11:21 - 11:49\n11:58 - 12:23\n12:28 - 12:55")
        
        //2 hour delay schedule, 4 blocks becuase no plus (and 4 lunches)
        delBlock.append("1st/2nd period")
        delBlockT.append("10:10 - 11:09")
        delBlock.append("3rd/4th period")
        delBlockT.append("11:15 - 12:14")
        delBlock.append("5th/6th period")
        delBlockT.append("12:20 - 2:24")
        delBlock.append("7th period")
        delBlockT.append("2:30 - 2:55")
        delBlock.append("1st Lunch\n2nd Lunch\n3rd Lunch\n4th Lunch")
        delBlockT.append("12:14 - 12:43\n12:48 - 1:17\n1:22 - 1:50\n1:55 - 2:24")
    }
	
    func magic(_ r: Int, _ s: Int) -> Array<String> {
        switch s{
        case 0: return potion(periodArray: regBlock, timeArray: regBlockT, row: r) //i know the potion function is a complete waste of code
        case 1: return potion(periodArray: ereBlock, timeArray: ereBlockT, row: r) //but i just wanted to have a little fun, and magic returns
	case 2: return potion(periodArray: delBlock, timeArray: delBlockT, row: r) //potion - magic potion. hahaha please send help.
        default: return ["Your're a wizard Harry!", "just kidding, you're a muggle"]
        }
    }
    
    func potion(periodArray p: Array<String>, timeArray t: Array<String>, row r: Int) -> Array<String> {
        return [p[r], t[r]]
    }
	//3 different bell schedule apps
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
	
	//the different sections may or may not have plusses so we need to return different lengths
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       switch section {
        case 0: return regBlock.count
        case 1: return ereBlock.count
	case 2: return delBlock.count
        default: return 0
        }
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
